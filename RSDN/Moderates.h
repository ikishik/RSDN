//
//  Moderates.h
//  RSDN
//
//  Created by Igor Kishik on 04.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Forums, Messages, Users;

@interface Moderates : NSManagedObject

@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) Forums *forum;
@property (nonatomic, retain) Messages *message;
@property (nonatomic, retain) Messages *topic;
@property (nonatomic, retain) Users *user;

@end
