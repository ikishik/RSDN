//
//  ForumsGroupController.m
//  RSDN
//
//  Created by Kishik Igor on 24.07.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumsGroupController.h"
#import "ForumGroups+Create.h"
#import "Forums+Create.h"
#import "LoginViewController.h"

@interface ForumsGroupController () <LoginViewControllerDelegate>
-(BOOL)CheckLoginAndPassword;
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
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"sortOrder" ascending:YES]];
    
    // no predicate because we want ALL the ForumGroups 
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.rsdnDatabase.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (void)fetchWebDataIntoDocument:(UIManagedDocument *)document
{
    /*
    if([self CheckLoginAndPassword])
    {
    dispatch_queue_t fetchQ = dispatch_queue_create("RSDN fetcher", NULL);
    dispatch_async(fetchQ, ^{
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *login = [defaults objectForKey:@"login"];
        NSString *password = [defaults objectForKey:@"password"];
        
        JanusAT *ser = JanusAT.service;
        
        ForumRequest *freq = [[ForumRequest alloc] init];
        freq.userName = login;
        freq.password = password;
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
                ForumGroups *group = [grDict objectForKey:forumInfo.forumGroupId];
                [Forums forumsWithInfo:forumInfo withGroup:group inManagedObjectContext:document.managedObjectContext];
            }
            
            [document saveToURL:document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
        }];
    });
    dispatch_release(fetchQ);
    }
    else
    {
        [self performSegueWithIdentifier:@"LogInSegue" sender:self];
    }
     */
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
    
    if ([segue.destinationViewController respondsToSelector:@selector(setGroup:)]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        ForumGroups *group = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [segue.destinationViewController performSelector:@selector(setGroup:) withObject:group];
    } else if([segue.identifier isEqualToString:@"LogInSegue"]){
        LoginViewController *lic = (LoginViewController *)segue.destinationViewController;
        lic.delegate = self;
    }
}

-(BOOL)CheckLoginAndPassword
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *login = [defaults objectForKey:@"login"];
    NSString *password = [defaults objectForKey:@"password"];
    
    if (!login || !password ||  login.length == 0 || password.length == 0) {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

-(void)LoginViewController:(LoginViewController *)sender Login:(NSString *)login andPassword:(NSString *)password
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:login forKey:@"login"];
    [defaults setObject:password forKey:@"password"];
    
    [defaults synchronize];
    
    [self dismissModalViewControllerAnimated:YES];
    [self fetchWebDataIntoDocument:self.rsdnDatabase];
}
 

@end
