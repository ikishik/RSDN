//
//  Moderates.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Forums, Messages, Users;

@interface Moderates : NSManagedObject

@property (nonatomic, retain) NSNumber * messageId;
@property (nonatomic, retain) NSNumber * forumId;
@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) Users *user;
@property (nonatomic, retain) Forums *forum;
@property (nonatomic, retain) Messages *topic;
@property (nonatomic, retain) Messages *message;

@end
