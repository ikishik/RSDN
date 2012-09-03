//
//  Messages.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Forums, Messages, Moderates, Ratings, Users;

@interface Messages : NSManagedObject

@property (nonatomic, retain) NSNumber * messageId;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSString * subject;
@property (nonatomic, retain) NSString * messageName;
@property (nonatomic, retain) NSString * userNick;
@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSNumber * articleId;
@property (nonatomic, retain) NSDate * messageDate;
@property (nonatomic, retain) NSDate * updateDate;
@property (nonatomic, retain) NSString * userRole;
@property (nonatomic, retain) NSString * userTitle;
@property (nonatomic, retain) NSNumber * userTitleColor;
@property (nonatomic, retain) NSDate * lastModerated;
@property (nonatomic, retain) NSNumber * closed;
@property (nonatomic, retain) NSSet *moderatesbyTopic;
@property (nonatomic, retain) NSSet *moderatesbyMessage;
@property (nonatomic, retain) Messages *topic;
@property (nonatomic, retain) NSSet *messages;
@property (nonatomic, retain) Messages *parent;
@property (nonatomic, retain) NSSet *childs;
@property (nonatomic, retain) Users *user;
@property (nonatomic, retain) Forums *forum;
@property (nonatomic, retain) NSSet *ratingsbyTopic;
@property (nonatomic, retain) NSSet *ratingsbyMessage;
@end

@interface Messages (CoreDataGeneratedAccessors)

- (void)addModeratesbyTopicObject:(Moderates *)value;
- (void)removeModeratesbyTopicObject:(Moderates *)value;
- (void)addModeratesbyTopic:(NSSet *)values;
- (void)removeModeratesbyTopic:(NSSet *)values;

- (void)addModeratesbyMessageObject:(Moderates *)value;
- (void)removeModeratesbyMessageObject:(Moderates *)value;
- (void)addModeratesbyMessage:(NSSet *)values;
- (void)removeModeratesbyMessage:(NSSet *)values;

- (void)addMessagesObject:(Messages *)value;
- (void)removeMessagesObject:(Messages *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

- (void)addChildsObject:(Messages *)value;
- (void)removeChildsObject:(Messages *)value;
- (void)addChilds:(NSSet *)values;
- (void)removeChilds:(NSSet *)values;

- (void)addRatingsbyTopicObject:(Ratings *)value;
- (void)removeRatingsbyTopicObject:(Ratings *)value;
- (void)addRatingsbyTopic:(NSSet *)values;
- (void)removeRatingsbyTopic:(NSSet *)values;

- (void)addRatingsbyMessageObject:(Ratings *)value;
- (void)removeRatingsbyMessageObject:(Ratings *)value;
- (void)addRatingsbyMessage:(NSSet *)values;
- (void)removeRatingsbyMessage:(NSSet *)values;

@end
