//
//  MessagesViewController.h
//  RSDN
//
//  Created by Igor Kishik on 07.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "Messages+FetchRequests.h"

@interface MessagesViewController : CoreDataTableViewController

@property (nonatomic, strong) Messages *topic;

@end
