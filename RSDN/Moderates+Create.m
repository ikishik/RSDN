//
//  Moderates+Create.m
//  RSDN
//
//  Created by Igor Kishik on 04.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Moderates+Create.h"

@implementation Moderates (Create)

+ (Moderates *)moderatesWithInfo:(JanusModerateInfo *)moderateInfo
                    withUser:(Users *)user
                 withMessage:(Messages *)message
                 withTopic:(Messages *)topic
                 withForum:(Forums *)forum
      inManagedObjectContext:(NSManagedObjectContext *)context
{
    Moderates *moderate = nil;
    
    moderate = [NSEntityDescription insertNewObjectForEntityForName:@"Moderates" inManagedObjectContext:context];
        
    moderate.message = message;
    moderate.user = user;
    moderate.topic = topic;
    moderate.forum = forum;
    moderate.createDate = moderateInfo.create;
        
    
    return moderate;
}

@end
