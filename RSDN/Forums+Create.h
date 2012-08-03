//
//  Forums+Create.h
//  RSDN
//
//  Created by Igor Kishik on 03.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Forums.h"
#import "ForumGroups.h"
#import "rsdnClient.h"

@interface Forums (Create)

+ (Forums *)forumsWithInfo:(JanusForumInfo *)forumInfo
                            withGroup:(ForumGroups *)group
                inManagedObjectContext:(NSManagedObjectContext *)context;


@end
