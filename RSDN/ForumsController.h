//
//  ForumsController.h
//  RSDN
//
//  Created by Kishik Igor on 24.07.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForumGroups.h"
#import "CoreDataTableViewController.h"

@interface ForumsController : CoreDataTableViewController

@property (nonatomic, strong) ForumGroups *group;

@end
