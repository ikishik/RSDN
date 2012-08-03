//
//  ForumsGroupController.m
//  RSDN
//
//  Created by Kishik Igor on 24.07.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumsGroupController.h"
#import "rsdnClient.h"
#import "ForumGroups.h"
#import "ForumGroups+Create.h"
#import "Forums.h"
#import "Forums+Create.h"

@interface ForumsGroupController ()

@end

@implementation ForumsGroupController

@synthesize rsdnDatabase = _rsdnDatabase;

- (void)setRsdnDatabase:(UIManagedDocument *)rsdnDatabase
{
    if (_rsdnDatabase != rsdnDatabase) {
        _rsdnDatabase = rsdnDatabase;
        [self useDocument];
    }
}

- (void)setupFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ForumGroups"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"sortOrder" ascending:YES selector:@selector(compare:)]];
    
    // no predicate because we want ALL the ForumGroups 
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.rsdnDatabase.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (void)fetchWebDataIntoDocument:(UIManagedDocument *)document
{
    dispatch_queue_t fetchQ = dispatch_queue_create("RSDN fetcher", NULL);
    dispatch_async(fetchQ, ^{
        
        JanusAT *ser = JanusAT.service;
        
        ForumRequest *freq = [[ForumRequest alloc] init];
        freq.userName = @"Demandred";
        freq.password = @"kishik";
        freq.forumsRowVersion = @"";
        
        NSError *error = nil;
        ForumResponse *resp = [ser GetForumList:freq error:&error];
        NSArray *groups = resp.groupList;
        NSArray *forums = resp.forumList;
        
        [document.managedObjectContext performBlock:^{
            
            NSMutableDictionary *grDict = [[NSMutableDictionary alloc] init];
            
            for (JanusForumGroupInfo *groupInfo in groups)
            {
                ForumGroups *gr = [ForumGroups groupsWithInfo:groupInfo inManagedObjectContext:document.managedObjectContext];
                [grDict setObject:gr forKey:gr.forumGroupId];
            }
            
            for (JanusForumInfo *forumInfo in forums)
            {
                [Forums forumsWithInfo:forumInfo withGroups:grDict inManagedObjectContext:document.managedObjectContext];
            }
            
            [document saveToURL:document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
        }];
    });
    dispatch_release(fetchQ);    
}

- (void)useDocument
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.rsdnDatabase.fileURL path]]) {
        // does not exist on disk, so create it
        [self.rsdnDatabase saveToURL:self.rsdnDatabase.fileURL forSaveOperation:UIDocumentSaveForCreating completionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
            [self fetchWebDataIntoDocument:self.rsdnDatabase];
            
        }];
    } else if (self.rsdnDatabase.documentState == UIDocumentStateClosed) {
        // exists on disk, but we need to open it
        [self.rsdnDatabase openWithCompletionHandler:^(BOOL success) {
            [self setupFetchedResultsController];
        }];
    } else if (self.rsdnDatabase.documentState == UIDocumentStateNormal) {
        // already open and ready to use
        [self setupFetchedResultsController];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.rsdnDatabase) {  
        NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        
        url = [url URLByAppendingPathComponent:@"Default RSDN Database"];
        
        self.rsdnDatabase = [[UIManagedDocument alloc] initWithFileURL:url];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FGCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    ForumGroups *group = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = group.forumGroupName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d forums", [group.forums count]];
    
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    ForumGroups *group = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    if ([segue.destinationViewController respondsToSelector:@selector(setGroup:)]) {
        [segue.destinationViewController performSelector:@selector(setGroup:) withObject:group];
    }
}
 

@end
