//
//  ForumsController.m
//  RSDN
//
//  Created by Kishik Igor on 24.07.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "ForumsController.h"
#import "Forums.h"

@interface ForumsController ()

@end

@implementation ForumsController

@synthesize group = _group;

- (void)setGroup:(ForumGroups *)group
{
    _group = group;
    self.title = group.forumGroupName;
    [self setupFetchedResultsController];
}

- (void)setupFetchedResultsController // attaches an NSFetchRequest to this UITableViewController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Forums"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"forumName"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    request.predicate = [NSPredicate predicateWithFormat:@"forumGroup.forumGroupId = %@", self.group.forumGroupId];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.group.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    Forums *forum = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = forum.shortForumName;
    cell.detailTextLabel.text = forum.forumName;
    
    return cell;

}

@end
