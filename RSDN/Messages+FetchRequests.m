//
//  Messages+FetchRequests.m
//  RSDN
//
//  Created by Igor Kishik on 07.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Messages+FetchRequests.h"

@implementation Messages (FetchRequests)

+ (NSArray *)getTopicsByForum:(Forums*) forum WithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Messages"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:sort
                                                                                     ascending:YES
                                                                                      selector:nil]];
    request.predicate = [NSPredicate predicateWithFormat:@"forum.forumId = %@ AND topic == nil", forum.forumId];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    
    return matches;
}

+ (NSArray *)getMessagesByTopic:(Messages*) topic WithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Messages"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:sort
                                                                                     ascending:YES
                                                                                      selector:nil]];
    request.predicate = [NSPredicate predicateWithFormat:@"topic.messageId = %@", topic.messageId];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    
    return matches;
}

+ (NSArray *)getMessagesByForums:(Forums*) forum WithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Messages"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:sort
                                                                                     ascending:YES
                                                                                      selector:nil]];
    request.predicate = [NSPredicate predicateWithFormat:@"forum.forumId = %@", forum.forumId];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    
    return matches;
}

@end
