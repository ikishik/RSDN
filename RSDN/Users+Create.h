//
//  Users+Create.h
//  RSDN
//
//  Created by Igor Kishik on 04.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Users.h"
#import "JanusUserInfo.h"

@interface Users (Create)

+ (Users *)usersWithInfo:(JanusUserInfo *)userInfo
  inManagedObjectContext:(NSManagedObjectContext *)context;

@end
