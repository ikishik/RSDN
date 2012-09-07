//
//  TopicsViewController.h
//  RSDN
//
//  Created by Igor Kishik on 07.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Forums.h"
#import "CoreDataTableViewController.h"

@interface TopicsViewController : CoreDataTableViewController

@property (nonatomic, strong) Forums *forum;

@end
