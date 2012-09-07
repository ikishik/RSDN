//
//  Forums+FetchRequests.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Forums.h"

@interface Forums (FetchRequests)

+ (NSArray *)getForumsWithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context;
+ (NSArray *)getSubscribedForumsWithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context;

@end
