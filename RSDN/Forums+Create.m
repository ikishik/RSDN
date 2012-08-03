//
//  Forums+Create.m
//  RSDN
//
//  Created by Igor Kishik on 03.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Forums+Create.h"

@implementation Forums (Create)

+ (Forums *)forumsWithInfo:(JanusForumInfo *)forumInfo
                withGroup:(ForumGroups *)group
    inManagedObjectContext:(NSManagedObjectContext *)context
{
    Forums *forum = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Forums"];
    request.predicate = [NSPredicate predicateWithFormat:@"forumId = %@", forumInfo.forumId];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"shortForumName" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        forum = [NSEntityDescription insertNewObjectForEntityForName:@"Forums" inManagedObjectContext:context];
        
        forum.forumId = forumInfo.forumId;
        forum.forumName = forumInfo.forumName;
        forum.inTop = forumInfo.inTop;
        forum.rated = forumInfo.rated;
        forum.rateLimit = forumInfo.rateLimit;
        forum.shortForumName = forumInfo.shortForumName;
        forum.forumGroup = group;// [grDict objectForKey:forumInfo.forumGroupId];
        
    } else {
        forum = [matches lastObject];
    }
    
    return forum;
}

@end
