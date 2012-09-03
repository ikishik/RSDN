//
//  Forums+FetchRequests.m
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Forums+FetchRequests.h"

@implementation Forums (FetchRequests)

+ (NSArray *)GetForumsWithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context;
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Forums"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:sort
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    
    return matches;
}

+ (NSArray *)GetSubscribedForumsWithSort:(NSString *)sort inManagedObjectContext:(NSManagedObjectContext *)context;
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Forums"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:sort
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    request.predicate = [NSPredicate predicateWithFormat:@"subscrube = YES"];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    
    return matches;
}

@end
