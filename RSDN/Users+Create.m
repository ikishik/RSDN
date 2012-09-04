//
//  Users+Create.m
//  RSDN
//
//  Created by Igor Kishik on 04.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Users+Create.h"

@implementation Users (Create)

+ (Users *)usersWithInfo:(JanusUserInfo *)userInfo
  inManagedObjectContext:(NSManagedObjectContext *)context
{
    Users *user = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Users"];
    request.predicate = [NSPredicate predicateWithFormat:@"userId = %@", [NSNumber numberWithInt:userInfo.userId]];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"userNick" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        user = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
        
        user.userId = [NSNumber numberWithInt:userInfo.userId];
        user.userName = userInfo.userName;
        user.userNick = userInfo.userNick;
        user.realName = userInfo.realName;
        user.publicEmail = userInfo.publicEmail;
        user.homePage = userInfo.homePage;
        user.specialization = userInfo.specialization;
        user.whereFrom = userInfo.whereFrom;
        user.origin = userInfo.origin;
        user.userClass = [NSNumber numberWithInt:userInfo.userClass];
        
    } else {
        user = [matches lastObject];
    }
    
    return user;
}

@end
