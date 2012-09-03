//
//  Forums.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ForumGroups, Messages, Moderates;

@interface Forums : NSManagedObject

@property (nonatomic, retain) NSNumber * forumId;
@property (nonatomic, retain) NSString * forumName;
@property (nonatomic, retain) NSNumber * inTop;
@property (nonatomic, retain) NSNumber * rated;
@property (nonatomic, retain) NSNumber * rateLimit;
@property (nonatomic, retain) NSString * shortForumName;
@property (nonatomic, retain) NSNumber * subscrube;
@property (nonatomic, retain) ForumGroups *forumGroup;
@property (nonatomic, retain) NSSet *moderates;
@property (nonatomic, retain) NSSet *messages;
@end

@interface Forums (CoreDataGeneratedAccessors)

- (void)addModeratesObject:(Moderates *)value;
- (void)removeModeratesObject:(Moderates *)value;
- (void)addModerates:(NSSet *)values;
- (void)removeModerates:(NSSet *)values;

- (void)addMessagesObject:(Messages *)value;
- (void)removeMessagesObject:(Messages *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

@end
