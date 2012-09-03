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

@implementation Synchroner

-(id)initWithManagedObjectContext:(NSManagedObjectContext *)context;
{
    self = [super init];
    if (self != nil)
    {
        self.context = context;
    }
    return self;
}

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
    
    /*
    UserByIdsRequest *ureq = [[UserByIdsRequest alloc] init];
    ureq.userName = login;
    ureq.password = password;
    ureq.userIds = [NSArray arrayWithObjects:[NSNumber numberWithInteger:16494], nil];//16494
    
    NSError *error = nil;
    UserResponse *uresp = [ser GetUserByIds:ureq error:&error];
    */    
    
    
    /*
    NSError *error = nil;
    ForumResponse *resp = [ser GetForumList:freq error:&error];
    NSArray *groups = resp.groupList;
    NSArray *forums = resp.forumList;
        
    NSMutableDictionary *grDict = [[NSMutableDictionary alloc] init];
            
    for (JanusForumGroupInfo *groupInfo in groups)
    {
        ForumGroups *gr = [ForumGroups groupsWithInfo:groupInfo inManagedObjectContext:context];
        [grDict setObject:gr forKey:gr.forumGroupId];
    }
            
    for (JanusForumInfo *forumInfo in forums)
    {
        ForumGroups *group = [grDict objectForKey:forumInfo.forumGroupId];
        [Forums forumsWithInfo:forumInfo withGroup:group inManagedObjectContext:context];
                
    }
    
    [defaults setObject:[NSDate date] forKey:@"forumsReqDate"];
    [defaults setObject:resp.forumsRowVersion forKey:@"forumsRowVersion"];
    
    [defaults synchronize];
    */
     
            
}

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

-(void)syncMessages
{

}

/*
-(void)syncMessages
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:@"login"];
    NSString *password = [defaults objectForKey:@"password"];
    
    NSMutableDictionary *messages = [[NSMutableDictionary alloc] init];
    NSMutableArray *moderates = [[NSMutableArray alloc] init];
    NSMutableArray *rates = [[NSMutableArray alloc] init];
    NSMutableArray *users = [[NSMutableArray alloc] init];
    
    JanusAT *ser = JanusAT.service;
    BOOL syncFinish = NO;
    
    while (!syncFinish) {
        ChangeRequest *creq = [[ChangeRequest alloc] init];
        creq.userName = login;
        creq.password = password;
        creq.maxOutput = 1000; //нужно будет поиграться с значением этого поля
        creq.messageRowVersion = [self GetNSDataFromUserDefaults:@"messageRowVersion"];
        //creq.moderateRowVersion = [Synchroner GetDataFromUserDefaults:@"lastModerateRowVersion"];
        //creq.ratingRowVersion = [Synchroner GetDataFromUserDefaults:@"lastRatingRowVersion"];
        
        
        
        NSMutableArray *subscribedForums = [[NSMutableArray alloc] init];
        
        NSArray *forums = [Forums GetSubscribedForumsWithSort:@"forumName" inManagedObjectContext:self.context];
        
        for (Forums *forum in forums)
        {
            RequestForumInfo *fInfo = [[RequestForumInfo alloc] init];
            
            fInfo.forumId =  [forum.forumId intValue];
            [subscribedForums addObject:fInfo];
        }
        
        creq.subscribedForums = subscribedForums;
        
        
        NSError *error = nil;
        ChangeResponse *resp = [ser GetNewData:creq error:&error];
        
        if ((resp.nMessages == nil || resp.nMessages.count == 0)
            && (resp.nModerate == nil || resp.nModerate.count == 0)
            && (resp.nRating == nil || resp.nRating.count == 0))
        {
            syncFinish = YES;
            break;
        }
        
        NSArray *msgs = resp.nMessages;
        NSArray *mdrs = resp.nModerate;
        NSArray *rts = resp.nRating;
        
        
        
        for (JanusMessageInfo *messageInfo in msgs)
        {
            [messages setObject:messageInfo forKey:messageInfo.messageId];
            [users addObject:messageInfo.userId];
        }
        
        for (JanusModerateInfo *moderateInfo in mdrs)
        {
            [moderates addObject:moderateInfo];
        }
        
        for (JanusRatingInfo *ratingInfo in rts)
        {
            [rates addObject:ratingInfo];
        }
        
        [defaults setObject:[NSDate date] forKey:@"DataReqDate"];
        [defaults setObject:resp.lastForumRowVersion forKey:@"messageRowVersion"];
        [defaults setObject:resp.lastModerateRowVersion forKey:@"lastModerateRowVersion"];
        [defaults setObject:resp.lastRatingRowVersion forKey:@"lastRatingRowVersion"];
        
        [defaults synchronize];
         
    
    }
    
    UserByIdsRequest *ureq = [[UserByIdsRequest alloc] init];
    ureq.userName = login;
    ureq.password = password;
    ureq.userIds = users;
    
}
 */

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


@end
