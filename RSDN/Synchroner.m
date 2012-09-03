//
//  Synchroner.m
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Synchroner.h"
#import "rsdnClient.h"
#import "ForumGroups+Create.h"
#import "Forums+Create.h"
#import "Forums+FetchRequests.h"

@implementation Synchroner

+(void)syncForumsAndGroupsInManagedObjectContext:(NSManagedObjectContext *)context
{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:@"login"];
    NSString *password = [defaults objectForKey:@"password"];
        
    JanusAT *ser = JanusAT.service;
        
    ForumRequest *freq = [[ForumRequest alloc] init];
    freq.userName = login;
    freq.password = password;
    freq.forumsRowVersion = [Synchroner GetDataFromUserDefaults:@"forumsRowVersion"];
        
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
            
}

+(void)syncMessagesInManagedObjectContext:(NSManagedObjectContext *)context
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
        creq.maxOutput = [NSNumber numberWithInteger:1000]; //нужно будет поиграться с значением этого поля
        creq.messageRowVersion = [Synchroner GetDataFromUserDefaults:@"messageRowVersion"];
        creq.moderateRowVersion = [Synchroner GetDataFromUserDefaults:@"lastModerateRowVersion"];
        creq.ratingRowVersion = [Synchroner GetDataFromUserDefaults:@"lastRatingRowVersion"];
        
        
        
        NSMutableArray *subscribedForums = [[NSMutableArray alloc] init];
        
        NSArray *forums = [Forums GetSubscribedForumsWithSort:@"forumName" inManagedObjectContext:context];
        
        for (Forums *forum in forums)
        {
            RequestForumInfo *fInfo = [[RequestForumInfo alloc] init];
            
            fInfo.forumId = forum.forumId;
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
    
    
}

+(NSString *)GetDataFromUserDefaults:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *retValue = [defaults objectForKey:key];
    
    if (!retValue)
    {
        retValue = @"";
    }
    
    return retValue;
}


@end
