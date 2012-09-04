//
//  Moderates+Create.h
//  RSDN
//
//  Created by Igor Kishik on 04.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Moderates.h"
#import "Users.h"
#import "Messages.h"
#import "JanusModerateInfo.h"

@interface Moderates (Create)

+ (Moderates *)usersWithInfo:(JanusModerateInfo *)moderateInfo
                    withUser:(Users *)user
                 withMessage:(Messages *)message
                   withTopic:(Messages *)topic
                   withForum:(Forums *)forum
      inManagedObjectContext:(NSManagedObjectContext *)context;

@end
