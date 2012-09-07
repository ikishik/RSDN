//
//  Ratings+Create.m
//  RSDN
//
//  Created by Igor Kishik on 04.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Ratings+Create.h"

@implementation Ratings (Create)

+ (Ratings *)ratingsWithInfo:(JanusRatingInfo *)ratingInfo
                  withUser:(Users *)user
               withMessage:(Messages *)message
                 withTopic:(Messages *)topic
    inManagedObjectContext:(NSManagedObjectContext *)context
{
    Ratings *rating = nil;
    
    rating = [NSEntityDescription insertNewObjectForEntityForName:@"Ratings" inManagedObjectContext:context];
    
    rating.message = message;
    rating.user = user;
    rating.topic = topic;
    rating.userRating = [NSNumber numberWithInt:ratingInfo.userRating];
    rating.rate = [NSNumber numberWithInt:ratingInfo.rate];
    rating.rateDate = ratingInfo.rateDate;
    
    return rating;
}

@end
