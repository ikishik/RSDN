//
//  Messages+Create.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Messages.h"
#import "JanusMessageInfo.h"
#import "Forums+FetchRequests.h"
#import "Users.h"

@interface Messages (Create)

+ (Messages *)messageWithInfo:(JanusMessageInfo *)messageInfo
                    withTopic:(Messages *)topic
                   withParent:(Messages *)parent
                    withForum:(Forums *)forum
                     withUser:(Users *)user
       inManagedObjectContext:(NSManagedObjectContext *)context;

@end
