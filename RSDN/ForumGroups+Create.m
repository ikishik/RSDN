//
//  ForumGroups+Create.m
//  RSDN
//
//  Created by Igor Kishik on 03.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumGroups+Create.h"

@implementation ForumGroups (Create)

+ (ForumGroups *)groupsWithInfo:(JanusForumGroupInfo *)groupInfo
        inManagedObjectContext:(NSManagedObjectContext *)context
{
    ForumGroups *group = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ForumGroups"];
    request.predicate = [NSPredicate predicateWithFormat:@"forumGroupId = %@", groupInfo.forumGroupId];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"sortOrder" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        group = [NSEntityDescription insertNewObjectForEntityForName:@"ForumGroups" inManagedObjectContext:context];
        
        group.forumGroupId = groupInfo.forumGroupId;
        group.forumGroupName = groupInfo.forumGroupName;
        group.sortOrder = groupInfo.sortOrder;
        
    } else {
        group = [matches lastObject];
    }
    
    return group;
}

@end
