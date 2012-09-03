//
//  Ratings.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Messages;

@interface Ratings : NSManagedObject

@property (nonatomic, retain) NSNumber * userRating;
@property (nonatomic, retain) NSNumber * rate;
@property (nonatomic, retain) NSDate * rateDate;
@property (nonatomic, retain) Messages *topic;
@property (nonatomic, retain) Messages *message;

@end
