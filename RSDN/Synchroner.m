//
//  Synchroner.m
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Synchroner.h"
#import "ForumRequest.h"
#import "ForumResponse.h"
#import "JanusAT.h"
#import "ForumGroups+Create.h"
#import "Forums+Create.h"
#import "Forums+FetchRequests.h"
#import "Users+Create.h"
#import "Messages+Create.h"
#import "Ratings+Create.h"
#import "Moderates+Create.h"

#import "Soap.h"

@interface Synchroner ()

@property (nonatomic, strong) NSMutableDictionary *messages;
@property (nonatomic, strong) NSMutableArray *moderates;
@property (nonatomic, strong) NSMutableArray *rates;
@property (nonatomic, strong) NSMutableArray *users;
@property (nonatomic, strong) NSMutableDictionary *coreUsers;
@property (nonatomic, strong) NSMutableDictionary *forums;
@property (nonatomic, strong) NSMutableDictionary *coreMessages;
@property (nonatomic, strong) NSMutableArray *brokenMessages;

-(void)writeMessagesToDB;
-(Messages *)saveMessage:(JanusMessageInfo *)messageInfo withRemainingDictionary:(NSMutableDictionary *)remainingMessages;
-(void)saveBrokenMessages;
-(void)saveRanings;
-(void)saveModerates;

-(NSString *)GetStringDataFromUserDefaults:(NSString *)key;
-(NSData *)GetNSDataFromUserDefaults:(NSString *)key;

@end

@implementation Synchroner


-(id)initWithManagedObjectContext:(NSManagedObjectContext *)context;
{
    self = [super init];
    if (self != nil)
    {
        self.context = context;
        self.messages = [[NSMutableDictionary alloc] init];
        self.moderates = [[NSMutableArray alloc] init];
        self.rates = [[NSMutableArray alloc] init];
        self.users = [[NSMutableArray alloc] init];
        self.coreUsers = [[NSMutableDictionary alloc] init];
        self.forums = [[NSMutableDictionary alloc] init];
        self.coreMessages = [[NSMutableDictionary alloc] init];
        self.brokenMessages = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Sync

-(void)syncForumsAndGroups
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:@"login"];
    NSString *password = [defaults objectForKey:@"password"];
        
    
    JanusAT * service = [JanusAT service];
	service.logging = YES;
    
    ForumRequest *freq = [[ForumRequest alloc] init];
    freq.userName = login;
    freq.password = password;
    freq.forumsRowVersion = [self GetNSDataFromUserDefaults:@"forumsRowVersion"];
    
    [service GetForumList:self action:@selector(GetForumListHandler:) forumRequest: freq];
}

-(void)syncMessages
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:@"login"];
    NSString *password = [defaults objectForKey:@"password"];
    
    
    JanusAT *service = JanusAT.service;
    
    ChangeRequest *creq = [[ChangeRequest alloc] init];
    creq.userName = login;
    creq.password = password;
    creq.maxOutput = 1000; //нужно будет поиграться с значением этого поля
    creq.messageRowVersion = [self GetNSDataFromUserDefaults:@"messageRowVersion"];
    creq.moderateRowVersion = [self GetNSDataFromUserDefaults:@"lastModerateRowVersion"];
    creq.ratingRowVersion = [self GetNSDataFromUserDefaults:@"lastRatingRowVersion"];
    
    
    //NSString *temp = [Soap getBase64String: creq.messageRowVersion];
    //NSString *temp2 = [Soap getBase64String: creq.moderateRowVersion];
    //NSString *temp3 = [Soap getBase64String: creq.ratingRowVersion];
        
    NSMutableArray *subscribedForums = [[NSMutableArray alloc] init];
        
    
    NSArray *forums = [Forums GetSubscribedForumsWithSort:@"forumName" inManagedObjectContext:self.context];
    for (Forums *forum in forums)
    {
        RequestForumInfo *fInfo = [[RequestForumInfo alloc] init];
            
        fInfo.forumId =  [forum.forumId intValue];
        
        //NSString *isFR = [defaults objectForKey:@"isFirstRequest"];
        //BOOL isF = (isFR == @"NO" ? NO : YES);
        
        fInfo.isFirstRequest = [forum.isFirstRequest boolValue];
        
        [subscribedForums addObject:fInfo];
        
        [self.forums setObject:forum forKey:forum.forumId];
    }
        
    creq.subscribedForums = subscribedForums;
        
    [service GetNewData:self action:@selector(GetNewDataHandler:) changeRequest: creq];
}

-(void)writeMessagesToDB
{
    
    NSMutableDictionary *remainingMessages = [[NSMutableDictionary alloc] init];
    
    /*
    //сначала сохраняем топики, позже нужно будет переделать алгоритм так что бы это не требовалось
    for (NSNumber *msgKey in self.messages)
    {
        JanusMessageInfo *msg = [self.messages objectForKey:msgKey];
        
        Users *user = [self.coreUsers objectForKey:[NSNumber numberWithInt:msg.userId]];
        Forums *forum = [self.forums objectForKey:[NSNumber numberWithInt:msg.forumId]];
        
        if (msg.topicId == 0 && msg.parentId == 0)
        {
            Messages *message = [Messages messageWithInfo:msg withTopic:nil withParent:nil withForum:forum withUser:user inManagedObjectContext:self.context];
            [self.coreMessages setObject:message forKey:message.messageId];
        }
        else
        {
            [remainingMessages setObject:msg forKey:[NSNumber numberWithInt:msg.messageId]];
        }
    }
    
    self.messages = [remainingMessages mutableCopy];
    remainingMessages = [[NSMutableDictionary alloc] init];
    */
     
    self.brokenMessages = [[NSMutableArray alloc] init];
    
    for (NSNumber *msgKey in self.messages)
    {
        JanusMessageInfo *msg = [self.messages objectForKey:msgKey];
        [self saveMessage:msg withRemainingDictionary:remainingMessages];
    }
    
    self.messages = [remainingMessages mutableCopy];
    
    if (self.brokenMessages && self.brokenMessages.count > 0)
    {
        [self saveBrokenMessages];
    }
    else
    {
        [self saveRanings];
        [self saveModerates];
    }
    
}

-(Messages *)saveMessage:(JanusMessageInfo *)messageInfo
 withRemainingDictionary:(NSMutableDictionary *)remainingMessages
{
    Messages *ret = nil;
    
    if (messageInfo.topicId == 0 && messageInfo.parentId == 0)
    {
        Users *user = [self.coreUsers objectForKey:[NSNumber numberWithInt:messageInfo.userId]];
        Forums *forum = [self.forums objectForKey:[NSNumber numberWithInt:messageInfo.forumId]];
        
        Messages *message = [Messages messageWithInfo:messageInfo withTopic:nil withParent:nil withForum:forum withUser:user inManagedObjectContext:self.context];
        [self.coreMessages setObject:message forKey:message.messageId];
        
        ret = message;
    }
    else
    {
        Messages *coreTopic = [self.coreMessages objectForKey:[NSNumber numberWithInt:messageInfo.topicId]];
        Messages *coreParent = [self.coreMessages objectForKey:[NSNumber numberWithInt:messageInfo.parentId]];
        JanusMessageInfo *parent = [self.messages objectForKey:[NSNumber numberWithInt:messageInfo.parentId]];
        JanusMessageInfo *topic = [self.messages objectForKey:[NSNumber numberWithInt:messageInfo.topicId]];
        
        if (coreTopic && coreParent)
        {
            Users *user = [self.coreUsers objectForKey:[NSNumber numberWithInt:messageInfo.userId]];
            Forums *forum = [self.forums objectForKey:[NSNumber numberWithInt:messageInfo.forumId]];
            
            Messages *message = [Messages messageWithInfo:messageInfo withTopic:coreTopic withParent:coreParent withForum:forum withUser:user inManagedObjectContext:self.context];
            [self.coreMessages setObject:message forKey:message.messageId];
            
            ret = message;
        }
        else if (parent && (coreTopic || topic))
        {
            Messages *tempParent = [self saveMessage:parent withRemainingDictionary:remainingMessages];
            Messages *tempTopic = nil;
            if(coreTopic)
            {
                tempTopic = coreTopic;
            }
            else
            {
                tempTopic = [self saveMessage:topic withRemainingDictionary:remainingMessages];
            }
            
            if (tempParent && tempTopic)
            {
                Users *user = [self.coreUsers objectForKey:[NSNumber numberWithInt:messageInfo.userId]];
                Forums *forum = [self.forums objectForKey:[NSNumber numberWithInt:messageInfo.forumId]];
                
                Messages *message = [Messages messageWithInfo:messageInfo withTopic:tempTopic withParent:tempParent withForum:forum withUser:user inManagedObjectContext:self.context];
                [self.coreMessages setObject:message forKey:message.messageId];
                
                ret = message;
            }
            else
            {
                [remainingMessages setObject:messageInfo forKey: [NSNumber numberWithInt:messageInfo.messageId]];
                [self.brokenMessages addObject:[NSNumber numberWithInt:messageInfo.messageId]];
            }
        }
        else
        {
            [remainingMessages setObject:messageInfo forKey: [NSNumber numberWithInt:messageInfo.messageId]];
            [self.brokenMessages addObject:[NSNumber numberWithInt:messageInfo.messageId]];
        }
        
    }
    
    return ret;
}

-(void)saveBrokenMessages
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:@"login"];
    NSString *password = [defaults objectForKey:@"password"];
    
    JanusAT *service = JanusAT.service;
    
    TopicRequest *treq = [[TopicRequest alloc] init];
    
    treq.userName = login;
    treq.password = password;
    treq.messageIds = self.brokenMessages;
    
    [service GetTopicByMessage:self action:@selector(GetTopicByMessageHandler:) topicRequest: treq];
}

-(void)saveRanings
{
    for (JanusRatingInfo *ratingInfo in self.rates)
    {
        Users *user = [self.coreUsers objectForKey:[NSNumber numberWithInt:ratingInfo.userId]];
        Messages *message = [self.coreMessages objectForKey:[NSNumber numberWithInt:ratingInfo.messageId]];
        Messages *topic = [self.coreMessages objectForKey:[NSNumber numberWithInt:ratingInfo.topicId]];
        
        if (user && message && topic)
        {
            [Ratings ratingsWithInfo:ratingInfo
                            withUser:user
                         withMessage:message
                           withTopic:topic
              inManagedObjectContext:self.context];
        }
    }
}

-(void)saveModerates
{
    for (JanusModerateInfo *moderateInfo in self.moderates)
    {
        Users *user = [self.coreUsers objectForKey:[NSNumber numberWithInt:moderateInfo.userId]];
        Messages *message = [self.coreMessages objectForKey:[NSNumber numberWithInt:moderateInfo.messageId]];
        Messages *topic = [self.coreMessages objectForKey:[NSNumber numberWithInt:moderateInfo.topicId]];
        Forums *forum = [self.forums objectForKey:[NSNumber numberWithInt:moderateInfo.forumId]];
        
        if (user && message && topic && forum)
        {
            [Moderates moderatesWithInfo:moderateInfo
                                withUser:user
                             withMessage:message
                               withTopic:topic
                               withForum:forum
                  inManagedObjectContext:self.context];
        }
    }
}

#pragma mark - JanusServer Handlers

- (void) GetForumListHandler: (id) value
{
    // Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}
    
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    ForumResponse* resp = (ForumResponse*)value;
    
    NSArray *groups = resp.groupList;
    NSArray *forums = resp.forumList;
    
    NSMutableDictionary *grDict = [[NSMutableDictionary alloc] init];
    
    for (JanusForumGroupInfo *groupInfo in groups)
    {
        ForumGroups *gr = [ForumGroups groupsWithInfo:groupInfo inManagedObjectContext:self.context];
        [grDict setObject:gr forKey:gr.forumGroupId];
    }
    
    for (JanusForumInfo *forumInfo in forums)
    {
        ForumGroups *group = [grDict objectForKey:[NSNumber numberWithInt:forumInfo.forumGroupId]];
        [Forums forumsWithInfo:forumInfo withGroup:group inManagedObjectContext:self.context];
        
    }
    
    [defaults setObject:[NSDate date] forKey:@"forumsReqDate"];
    [defaults setObject:resp.forumsRowVersion forKey:@"forumsRowVersion"];
    
    [defaults synchronize];
    
    [self.delegate SynchronerFinishSyncForums:self];
}


- (void) GetNewDataHandler: (id) value {
    
	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}
    
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}
    
    
    
    
    ChangeResponse* resp = (ChangeResponse*)value;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *login = [defaults objectForKey:@"login"];
    NSString *password = [defaults objectForKey:@"password"];
    
    [defaults setObject:[NSDate date] forKey:@"DataReqDate"];
    [defaults setObject:resp.lastForumRowVersion forKey:@"messageRowVersion"];
    [defaults setObject:resp.lastModerateRowVersion forKey:@"lastModerateRowVersion"];
    [defaults setObject:resp.lastRatingRowVersion forKey:@"lastRatingRowVersion"];
    
    for (NSNumber *fKey in self.forums)
    {
        Forums *forum = [self.forums objectForKey:fKey];
        forum.isFirstRequest = [NSNumber numberWithBool:NO];
    }
    
    [defaults synchronize];
    
    //NSString *temp = [Soap getBase64String: resp.lastForumRowVersion];
    //NSString *temp2 = [Soap getBase64String: resp.lastModerateRowVersion];
    //NSString *temp3 = [Soap getBase64String: resp.lastRatingRowVersion];
    
    
    if ((resp.nMessages == nil || resp.nMessages.count == 0)
        && (resp.nModerate == nil || resp.nModerate.count == 0)
        && (resp.nRating == nil || resp.nRating.count == 0)
        )
    {
        if (self.messages && self.messages.count > 0)
        {
            JanusAT *service = JanusAT.service;
            
            
            
            UserByIdsRequest *ureq = [[UserByIdsRequest alloc] init];
            ureq.userName = login;
            ureq.password = password;
            ureq.userIds = self.users;
            
            [service GetUserByIds:self action:@selector(GetUserByIdsHandler:) request: ureq];
        }
        
    }
    else
    {
        NSArray *msgs = resp.nMessages;
        NSArray *mdrs = resp.nModerate;
        NSArray *rts = resp.nRating;
    
        for (JanusMessageInfo *messageInfo in msgs)
        {
            [self.messages setObject:messageInfo forKey:[NSNumber numberWithInt:messageInfo.messageId]];
            [self.users addObject:[NSNumber numberWithInt:messageInfo.userId]];
        }
    
        for (JanusModerateInfo *moderateInfo in mdrs)
        {
            [self.moderates addObject:moderateInfo];
            [self.users addObject:[NSNumber numberWithInt:moderateInfo.userId]];
        }
    
        for (JanusRatingInfo *ratingInfo in rts)
        {
            [self.rates addObject:ratingInfo];
            [self.users addObject:[NSNumber numberWithInt:ratingInfo.userId]];
        }
        
        [self syncMessages];
    }
}

- (void) GetUserByIdsHandler: (id) value {
    
	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}
    
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    UserResponse* resp = (UserResponse*)value;
    
    NSArray *usrs = resp.users;
    
    self.coreUsers = [[NSMutableDictionary alloc] init];
    
    for (JanusUserInfo *userInfo in usrs)
    {
        Users *usr = [Users usersWithInfo:userInfo inManagedObjectContext:self.context];
        [self.coreUsers setObject:usr forKey:usr.userId];
    }
    
    
    [defaults setObject:resp.lastRowVersion forKey:@"lastUsersRowVersion"];
    [defaults synchronize];
    
    self.users = [[NSMutableArray alloc]init];
    
    [self writeMessagesToDB];
}

- (void) GetTopicByMessageHandler: (id) value {
    
	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}
    
	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}
    
    
    TopicResponse* resp = (TopicResponse*)value;
    
    for (JanusMessageInfo *messageInfo in resp.Messages)
    {
        JanusMessageInfo *msg = [self.messages objectForKey:[NSNumber numberWithInt:messageInfo.messageId]];
        if (!msg)
        {
            [self.messages setObject:messageInfo forKey:[NSNumber numberWithInt:messageInfo.messageId]];
        }
        
        [self.users addObject:[NSNumber numberWithInt:messageInfo.userId]];
    }
    
    
    for (JanusModerateInfo *moderateInfo in resp.Moderate)
    {
        [self.moderates addObject:moderateInfo];
    }
    
    for (JanusRatingInfo *ratingInfo in resp.Rating)
    {
        [self.rates addObject:ratingInfo];
    }
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:@"login"];
    NSString *password = [defaults objectForKey:@"password"];
    
    JanusAT *service = JanusAT.service;
    
    UserByIdsRequest *ureq = [[UserByIdsRequest alloc] init];
    ureq.userName = login;
    ureq.password = password;
    ureq.userIds = self.users;
    
    [service GetUserByIds:self action:@selector(GetUserByIdsHandler:) request: ureq];
}



#pragma mark - Get data from user defaults

-(NSString *)GetStringDataFromUserDefaults:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *retValue = [defaults objectForKey:key];
    
    if (!retValue)
    {
        retValue = @"";
    }
    
    return retValue;
}

-(NSData *)GetNSDataFromUserDefaults:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *retValue = [defaults objectForKey:key];
    
    if (!retValue)
    {
        retValue = [[NSData alloc]init];
    }
    
    return retValue;
}

-(BOOL)GetBoolFromUserDefaults:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL retValue = [defaults boolForKey:key];
    
    if (!retValue)
    {
        retValue = YES;
    }
    
    return retValue;
}


@end
