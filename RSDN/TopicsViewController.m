//
//  TopicsViewController.m
//  RSDN
//
//  Created by Igor Kishik on 07.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "TopicsViewController.h"
#import "Messages.h"

@interface TopicsViewController ()

@end

@implementation TopicsViewController

- (void)setForums:(Forums *)forum
{
    self.forum = forum;
    self.title = forum.forumName;
    [self setupFetchedResultsController];
}

- (void)setupFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Messages"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"messageDate"
                                                                                     ascending:YES
                                                                                      selector:nil]];
    request.predicate = [NSPredicate predicateWithFormat:@"forum.forumId = %@ AND topic == nil", self.forum.forumId];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.forum.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    Messages *message = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = message.subject;
    
    return cell;
    
}

@end
