//
//  RSDNViewController.m
//  RSDN
//
//  Created by Kishik Igor on 21.06.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "RSDNViewController.h"
#import "rsdnClient.h"

@interface RSDNViewController ()

@end

@implementation RSDNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    JanusAT *ser = JanusAT.service;
    
    ForumRequest *freq = [[ForumRequest alloc] init];
    freq.userName = @"Demandred";
    freq.password = @"kishik";
    freq.forumsRowVersion = @"";
    
    NSError *error = nil;
    ForumResponse *resp = [ser GetForumList:freq error:&error];
    int count = resp.forumList.count;
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
