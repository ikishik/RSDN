//
//  Forums.h
//  RSDN
//
//  Created by Igor Kishik on 03.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ForumGroups;

@interface Forums : NSManagedObject

@property (nonatomic, retain) NSNumber * forumId;
@property (nonatomic, retain) NSString * forumName;
@property (nonatomic, retain) NSNumber * inTop;
@property (nonatomic, retain) NSNumber * rated;
@property (nonatomic, retain) NSNumber * rateLimit;
@property (nonatomic, retain) NSString * shortForumName;
@property (nonatomic, retain) ForumGroups *forumGroup;

@end
