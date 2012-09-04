//
//  ForumsFirstViewController.m
//  RSDN
//
//  Created by Igor Kishik on 21.08.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumsFirstViewController.h"
#import "ForumGroups+Create.h"
#import "Forums+Create.h"
#import "LoginViewController.h"
#import "ForumsCheckViewController.h"
#import <QuickDialog/QuickDialog.h>
#import "Synchroner.h"
#import "Forums+FetchRequests.h"

#import "Soap.h"


@interface ForumsFirstViewController ()<LoginViewControllerDelegate,SynchronerDelegate>
-(BOOL)CheckLoginAndPassword;
-(void)showForumsCheckList;
-(void)SynchronerFinishSyncForums:(Synchroner *)sender;

@end

@implementation ForumsFirstViewController




- (void)setRsdnDatabase:(UIManagedDocument *)rsdnDatabase
{
    if (_rsdnDatabase != rsdnDatabase) {
        _rsdnDatabase = rsdnDatabase;
        [self useDocument];
    }
}

- (void)setupFetchedResultsController
{
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Forums"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"shortForumName"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    request.predicate = [NSPredicate predicateWithFormat:@"subscrube == YES"];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.rsdnDatabase.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}

- (void)fetchWebDataIntoDocument:(UIManagedDocument *)document
{

        dispatch_queue_t fetchQ = dispatch_queue_create("RSDN fetcher", NULL);
        dispatch_async(fetchQ, ^{
            [document.managedObjectContext performBlock:^{
                
                [document saveToURL:document.fileURL forSaveOperation:UIDocumentSaveForOverwriting completionHandler:NULL];
            }];
            
        });
        dispatch_release(fetchQ);
    
    
    NSString *nullVersionKey = @"AAAAAAAAAAA=";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[Soap dataFromString:nullVersionKey] forKey:@"forumsRowVersion"];
    [defaults setObject:[Soap dataFromString:nullVersionKey] forKey:@"messageRowVersion"];
    [defaults setObject:[Soap dataFromString:nullVersionKey] forKey:@"lastModerateRowVersion"];
    [defaults setObject:[Soap dataFromString:nullVersionKey] forKey:@"lastRatingRowVersion"];
    
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
        
        if(![self CheckLoginAndPassword])
        {
            [self performSegueWithIdentifier:@"LogInSegue" sender:self];
        }        
    }

    UIBarButtonItem *forumListButton = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleBordered target:self action:@selector(showForumsCheckList)];

    self.navigationItem.rightBarButtonItem = forumListButton;
    
    UIBarButtonItem *synchronizeButton = [[UIBarButtonItem alloc] initWithTitle:@"Sync" style:UIBarButtonItemStyleBordered target:self action:@selector(syncData)];
    
    self.navigationItem.leftBarButtonItem = synchronizeButton;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FGCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Forums *forum = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = forum.shortForumName;
    cell.detailTextLabel.text = forum.forumName;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"LogInSegue"]){
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
    
    [self syncData];
    
}

-(BOOL)CheckForumList
{
    NSArray *matches = [Forums GetSubscribedForumsWithSort:@"forumName" inManagedObjectContext:self.rsdnDatabase.managedObjectContext];
    
    if (matches.count == 0) {
        return FALSE;
    }
    else
    {
        return TRUE;
    }
}

-(void)showForumsCheckList
{
    
    NSArray *matches = [Forums GetForumsWithSort:@"forumName" inManagedObjectContext:self.rsdnDatabase.managedObjectContext];
    
    if (matches.count > 0)
    {
        ForumsCheckViewController *fcController = [[ForumsCheckViewController alloc] initWithMultiSelectAndForums:matches];
        [[self navigationController] pushViewController:fcController animated:YES];
    }
    
}

-(void)syncData
{
    //dispatch_queue_t fetchQ = dispatch_queue_create("RSDN fetcher", NULL);
    //dispatch_async(fetchQ, ^{
    
    Synchroner *sync = [[Synchroner alloc] initWithManagedObjectContext:self.rsdnDatabase.managedObjectContext];
    sync.delegate = self;
    
    [sync syncForumsAndGroups];
    
    //});
    //dispatch_release(fetchQ);
}

-(void)SynchronerFinishSyncForums:(Synchroner *)sender
{
    if(![self CheckForumList])
    {
        [self showForumsCheckList];
    }
    else
    {
        Synchroner *sync = [[Synchroner alloc] initWithManagedObjectContext:self.rsdnDatabase.managedObjectContext];
        [sync syncMessages];
    }
}


@end
