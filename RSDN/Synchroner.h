//
//  Synchroner.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Synchroner : NSObject

+(void)syncForumsAndGroupsInManagedObjectContext:(NSManagedObjectContext *)context;
+(void)syncMessagesInManagedObjectContext:(NSManagedObjectContext *)context;

+(NSString *)GetDataFromUserDefaults:(NSString *)key;

@end
