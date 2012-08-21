//
//  ForumsCheckViewController.m
//  RSDN
//
//  Created by Igor Kishik on 21.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumsCheckViewController.h"
#import "Forums.h"

@interface ForumsCheckViewController ()
@property (nonatomic, strong) QSelectSection *selectSection;
@property (nonatomic, strong) NSMutableDictionary *forumsDict;
@property (nonatomic, strong) NSManagedObjectContext *context;

@end

@implementation ForumsCheckViewController

@synthesize forumsDict = _forumsDict;
@synthesize context = _context;

-(id)initWithMultiSelectAndForums:(NSArray*)frms inManagedObjectContext:(NSManagedObjectContext *)context
{
    _context = context;
    _forumsDict = [[NSMutableDictionary alloc] init];
    NSMutableArray *fNames = [[NSMutableArray alloc] init];
    NSMutableArray *fCheck = [[NSMutableArray alloc] init];
    
    for (Forums *forumInfo in frms)
    {
        [fNames addObject:forumInfo.forumName];
        //if (forumInfo.subscrube != nil && forumInfo.subscrube == [NSNumber numberWithBool:YES] ) {
        //    [fCheck addObject:[NSNumber numberWithInt: 1]];
        //}
        //else
        //{
            [fCheck addObject:[NSNumber numberWithInt: 0]];

        //}
        
        
        [_forumsDict setObject:forumInfo forKey:forumInfo.forumName];
    }
    
    QRootElement *root = [[QRootElement alloc] init];
    root.grouped = YES;
    root.title = @"подписка на форумы";
    
    QSelectSection *multipleSelectSection =
    [[QSelectSection alloc] initWithItems:fNames 
                          selectedIndexes:fCheck
                                    title:@"Подписатся на:"];
    
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
    
        for (NSString *forumName in selected)
        {
            Forums *forum = [_forumsDict objectForKey:forumName];
            forum.subscrube = [NSNumber numberWithBool:YES];

        }
    
        NSError *error = nil;
        [_context save:&error];

    
    [[self navigationController] popViewControllerAnimated:YES];
}

@end
