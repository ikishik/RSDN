//
//  Ratings+Create.h
//  RSDN
//
//  Created by Igor Kishik on 04.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Ratings.h"
#import "Users.h"
#import "JanusRatingInfo.h"

@interface Ratings (Create)

+ (Ratings *)ratingsWithInfo:(JanusRatingInfo *)ratingInfo
                    withUser:(Users *)user
                 withMessage:(Messages *)message
                   withTopic:(Messages *)topic
      inManagedObjectContext:(NSManagedObjectContext *)context;

@end
