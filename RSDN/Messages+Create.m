//
//  Messages+Create.m
//  RSDN
//
//  Created by Igor Kishik on 03.09.12.
//  Copyright (c) 2012 ikishik.net. All rights reserved.
//

#import "Messages+Create.h"

@implementation Messages (Create)

+ (Messages *)messageWithInfo:(JanusMessageInfo *)messageInfo
                    withTopic:(Messages *)topic
                   withParent:(Messages *)parent
                    withForum:(Forums *)forum
                     withUser:(Users *)user
       inManagedObjectContext:(NSManagedObjectContext *)context
{
    Messages *msg = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Messages"];
    request.predicate = [NSPredicate predicateWithFormat:@"messageId = %@", messageInfo.messageId];
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"messageId" ascending:YES];
    request.sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    
    NSError *error = nil;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
    } else if ([matches count] == 0) {
        msg = [NSEntityDescription insertNewObjectForEntityForName:@"Messages" inManagedObjectContext:context];
        
        msg.messageId = [NSNumber numberWithInt:messageInfo.messageId];
        msg.topic = topic;
        msg.parent = parent;
        msg.forum = forum;
        msg.user = user;
        msg.status = [NSNumber numberWithInteger:1];
        msg.subject = messageInfo.subject;
        msg.messageName = messageInfo.messageName;
        msg.userNick = messageInfo.userNick;
        msg.message = messageInfo.message;
        msg.articleId = [NSNumber numberWithInt:messageInfo.articleId];
        msg.messageDate = messageInfo.messageDate;
        msg.updateDate = messageInfo.updateDate;
        msg.userRole = messageInfo.userRole;
        msg.userTitle = messageInfo.userTitle;
        msg.userTitleColor = [NSNumber numberWithInt:messageInfo.userTitleColor];
        msg.lastModerated = messageInfo.lastModerated;
        msg.closed = [NSNumber numberWithInt:messageInfo.closed];
        
    } else {
        msg = [matches lastObject];
    }
    
    return msg;
}

@end
