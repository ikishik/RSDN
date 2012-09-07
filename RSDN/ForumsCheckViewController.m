//
//  ForumsCheckViewController.m
//  RSDN
//
//  Created by Igor Kishik on 21.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumsCheckViewController.h"
#import "Forums.h"
#import "Messages+FetchRequests.h"

@interface ForumsCheckViewController ()
@property (nonatomic, strong) QSelectSection *selectSection;
@property (nonatomic, strong) NSMutableDictionary *forumsDict;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation ForumsCheckViewController


-(id)initWithMultiSelectAndForums:(NSArray*)frms
{
    _forumsDict = [[NSMutableDictionary alloc] init];
    
    NSMutableArray *fNames = [[NSMutableArray alloc] init];
    NSMutableArray *fCheck = [[NSMutableArray alloc] init];
    
    
    for (Forums *forumInfo in frms)
    {
        [fNames addObject:forumInfo.forumName];
        
        if (forumInfo.subscrube != nil && forumInfo.subscrube == [NSNumber numberWithInt:1] )
        {
            [fCheck addObject:forumInfo.forumName];
        }
        
        [_forumsDict setObject:forumInfo forKey:forumInfo.forumName];
    }
    
    
    
    QRootElement *root = [[QRootElement alloc] init];
    //root.grouped = YES;
    root.title = @"подписка на форумы";
    
    QSelectSection *multipleSelectSection =
    [[QSelectSection alloc] initWithItems:fNames
                          selectedItems:fCheck
                                    title:@"Подписаться на:"];
    
    multipleSelectSection.multipleAllowed = YES;
    
    [root addSection:multipleSelectSection];
    
    self.selectSection = multipleSelectSection;
    
    return [self initWithRoot:root];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(onDone)];
}

- (void)onDone
{
    
    NSArray *selected = [self.selectSection selectedItems];
    NSMutableDictionary *selectedForums = [[NSMutableDictionary alloc] init];
    
    for (NSString *forumName in selected)
    {
        Forums *forum = [_forumsDict objectForKey:forumName];
        [selectedForums setObject:forum forKey:forum.forumId];
        
    }
    
    for (NSString *key in _forumsDict)
    {
        Forums *forum = [_forumsDict objectForKey:key];
        Forums *forumInSelected = [selectedForums objectForKey:forum.forumId];
        
        if (forumInSelected)
        {
            forum.subscrube = [NSNumber numberWithBool:YES];
        }
        else
        {
            forum.subscrube = [NSNumber numberWithBool:NO];
            
            NSArray *messages = [Messages getMessagesByForums:forum WithSort:@"messageDate" inManagedObjectContext:forum.managedObjectContext];
            
            for (Messages *message in messages)
            {
                [forum.managedObjectContext deleteObject:message];
            }
        }
    }
    
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
