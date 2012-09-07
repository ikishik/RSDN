//
//  Messages+FetchRequests.h
//  RSDN
//
//  Created by Igor Kishik on 07.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Messages.h"
#import "Forums.h"

@interface Messages (FetchRequests)

+ (NSArray *)getTopicsByForum:(Forums*) forum WithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSArray *)getMessagesByTopic:(Messages*) topic WithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSArray *)getMessagesByForums:(Forums*) forum WithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context;

@end
