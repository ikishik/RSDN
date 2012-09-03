//
//  Users.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Messages, Moderates;

@interface Users : NSManagedObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userNick;
@property (nonatomic, retain) NSString * realName;
@property (nonatomic, retain) NSString * publicEmail;
@property (nonatomic, retain) NSString * homePage;
@property (nonatomic, retain) NSString * specialization;
@property (nonatomic, retain) NSString * whereFrom;
@property (nonatomic, retain) NSString * origin;
@property (nonatomic, retain) NSNumber * userClass;
@property (nonatomic, retain) NSSet *moderates;
@property (nonatomic, retain) NSSet *messages;
@end

@interface Users (CoreDataGeneratedAccessors)

- (void)addModeratesObject:(Moderates *)value;
- (void)removeModeratesObject:(Moderates *)value;
- (void)addModerates:(NSSet *)values;
- (void)removeModerates:(NSSet *)values;

- (void)addMessagesObject:(Messages *)value;
- (void)removeMessagesObject:(Messages *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

@end
