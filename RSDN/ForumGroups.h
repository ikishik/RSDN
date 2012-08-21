//
//  ForumGroups.h
//  RSDN
//
//  Created by Igor Kishik on 21.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Forums;

@interface ForumGroups : NSManagedObject

@property (nonatomic, retain) NSNumber * forumGroupId;
@property (nonatomic, retain) NSString * forumGroupName;
@property (nonatomic, retain) NSNumber * sortOrder;
@property (nonatomic, retain) NSSet *forums;
@end

@interface ForumGroups (CoreDataGeneratedAccessors)

- (void)addForumsObject:(Forums *)value;
- (void)removeForumsObject:(Forums *)value;
- (void)addForums:(NSSet *)values;
- (void)removeForums:(NSSet *)values;

@end
