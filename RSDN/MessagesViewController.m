//
//  MessagesViewController.m
//  RSDN
//
//  Created by Igor Kishik on 07.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "MessagesViewController.h"

@interface MessagesViewController ()

@end

@implementation MessagesViewController

- (void)setTopic:(Messages *)topic
{
    _topic = topic;
    self.title = topic.subject;
    [self setupFetchedResultsController];
}

- (void)setupFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Messages"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"messageDate"
                                                                                     ascending:YES
                                                                                      selector:nil]];
    request.predicate = [NSPredicate predicateWithFormat:@"topic.messageId = %@", self.topic.messageId];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.topic.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    
    Messages *message = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:message.messageDate];
    
    cell.textLabel.text = dateString;
    cell.detailTextLabel.text = message.message;
    
    return cell;
    
}

@end
