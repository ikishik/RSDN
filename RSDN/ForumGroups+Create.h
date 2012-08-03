//
//  ForumGroups+Create.h
//  RSDN
//
//  Created by Igor Kishik on 03.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumGroups.h"
#import "rsdnClient.h"

@interface ForumGroups (Create)
+ (ForumGroups *)groupsWithInfo:(JanusForumGroupInfo *)groupInfo
        inManagedObjectContext:(NSManagedObjectContext *)context;
@end
