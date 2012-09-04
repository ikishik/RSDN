//
//  Synchroner.h
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Synchroner;

@protocol SynchronerDelegate <NSObject>
-(void)SynchronerFinishSyncForums:(Synchroner *)sender;
@end

@interface Synchroner : NSObject
@property (nonatomic, weak) id<SynchronerDelegate> delegate;
@property (nonatomic, strong) NSManagedObjectContext *context;

-(id)initWithManagedObjectContext:(NSManagedObjectContext *)context;

-(void)syncForumsAndGroups;
-(void)syncMessages;


@end
