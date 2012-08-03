//
//  Forums+Create.h
//  RSDN
//
//  Created by Igor Kishik on 03.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Forums.h"
#import "rsdnClient.h"

@interface Forums (Create)

+ (Forums *)forumsWithInfo:(JanusForumInfo *)forumInfo
                            withGroups:(NSMutableDictionary *)grDict
                inManagedObjectContext:(NSManagedObjectContext *)context;


@end
