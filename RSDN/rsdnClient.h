#import <Foundation/Foundation.h>

#import "NSWSDL.h"
@class TopicRequest;
@class JanusMessageInfo;
@class JanusRatingInfo;
@class JanusModerateInfo;
@class RequestForumInfo;
@class ForumRequest;
@class JanusForumInfo;
@class JanusForumGroupInfo;
@class UserRequest;
@class JanusUserInfo;
@class PostMessageInfo;
@class PostRatingInfo;
@class PostModerateInfo;
@class PostExceptionInfo;
@class RatingExceptionInfo;
@class ModerateExceptionInfo;
@class TopicResponse;
@class ChangeRequest;
@class ChangeResponse;
@class ForumResponse;
@class UserResponse;
@class PostRequest;
@class PostResponse;


@interface TopicRequest : BaseWSObject{
	NSString* userName;
	NSString* password;
	NSArray* messageIds;
}

@property (readwrite) NSString* userName;
@property (readwrite) NSString* password;
@property (readwrite) NSArray* messageIds;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface JanusMessageInfo : BaseWSObject{
	NSNumber* messageId;
	NSNumber* topicId;
	NSNumber* parentId;
	NSNumber* userId;
	NSNumber* forumId;
	NSString* subject;
	NSString* messageName;
	NSString* userNick;
	NSString* message;
	NSNumber* articleId;
	NSDate* messageDate;
	NSDate* updateDate;
	NSString* userRole;
	NSString* userTitle;
	NSNumber* userTitleColor;
	NSDate* lastModerated;
	NSNumber* closed;
}

@property (readwrite) NSNumber* messageId;
@property (readwrite) NSNumber* topicId;
@property (readwrite) NSNumber* parentId;
@property (readwrite) NSNumber* userId;
@property (readwrite) NSNumber* forumId;
@property (readwrite) NSString* subject;
@property (readwrite) NSString* messageName;
@property (readwrite) NSString* userNick;
@property (readwrite) NSString* message;
@property (readwrite) NSNumber* articleId;
@property (readwrite) NSDate* messageDate;
@property (readwrite) NSDate* updateDate;
@property (readwrite) NSString* userRole;
@property (readwrite) NSString* userTitle;
@property (readwrite) NSNumber* userTitleColor;
@property (readwrite) NSDate* lastModerated;
@property (readwrite) NSNumber* closed;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface JanusRatingInfo : BaseWSObject{
	NSNumber* messageId;
	NSNumber* topicId;
	NSNumber* userId;
	NSNumber* userRating;
	NSNumber* rate;
	NSDate* rateDate;
}

@property (readwrite) NSNumber* messageId;
@property (readwrite) NSNumber* topicId;
@property (readwrite) NSNumber* userId;
@property (readwrite) NSNumber* userRating;
@property (readwrite) NSNumber* rate;
@property (readwrite) NSDate* rateDate;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface JanusModerateInfo : BaseWSObject{
	NSNumber* messageId;
	NSNumber* topicId;
	NSNumber* userId;
	NSNumber* forumId;
	NSDate* create;
}

@property (readwrite) NSNumber* messageId;
@property (readwrite) NSNumber* topicId;
@property (readwrite) NSNumber* userId;
@property (readwrite) NSNumber* forumId;
@property (readwrite) NSDate* create;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface RequestForumInfo : BaseWSObject{
	NSNumber* forumId;
	NSNumber* isFirstRequest;
}

@property (readwrite) NSNumber* forumId;
@property (readwrite) NSNumber* isFirstRequest;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface ForumRequest : BaseWSObject{
	NSString* userName;
	NSString* password;
	NSString* forumsRowVersion;
}

@property (readwrite) NSString* userName;
@property (readwrite) NSString* password;
@property (readwrite) NSString* forumsRowVersion;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface JanusForumInfo : BaseWSObject{
	NSNumber* forumId;
	NSNumber* forumGroupId;
	NSString* shortForumName;
	NSString* forumName;
	NSNumber* rated;
	NSNumber* inTop;
	NSNumber* rateLimit;
}

@property (readwrite) NSNumber* forumId;
@property (readwrite) NSNumber* forumGroupId;
@property (readwrite) NSString* shortForumName;
@property (readwrite) NSString* forumName;
@property (readwrite) NSNumber* rated;
@property (readwrite) NSNumber* inTop;
@property (readwrite) NSNumber* rateLimit;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface JanusForumGroupInfo : BaseWSObject{
	NSNumber* forumGroupId;
	NSString* forumGroupName;
	NSNumber* sortOrder;
}

@property (readwrite) NSNumber* forumGroupId;
@property (readwrite) NSString* forumGroupName;
@property (readwrite) NSNumber* sortOrder;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface UserRequest : BaseWSObject{
	NSString* userName;
	NSString* password;
	NSString* lastRowVersion;
	NSNumber* maxOutput;
}

@property (readwrite) NSString* userName;
@property (readwrite) NSString* password;
@property (readwrite) NSString* lastRowVersion;
@property (readwrite) NSNumber* maxOutput;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface JanusUserInfo : BaseWSObject{
	NSNumber* userId;
	NSString* userName;
	NSString* userNick;
	NSString* realName;
	NSString* publicEmail;
	NSString* homePage;
	NSString* specialization;
	NSString* whereFrom;
	NSString* origin;
	NSNumber* userClass;
}

@property (readwrite) NSNumber* userId;
@property (readwrite) NSString* userName;
@property (readwrite) NSString* userNick;
@property (readwrite) NSString* realName;
@property (readwrite) NSString* publicEmail;
@property (readwrite) NSString* homePage;
@property (readwrite) NSString* specialization;
@property (readwrite) NSString* whereFrom;
@property (readwrite) NSString* origin;
@property (readwrite) NSNumber* userClass;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface PostMessageInfo : BaseWSObject{
	NSNumber* localMessageId;
	NSNumber* parentId;
	NSNumber* forumId;
	NSString* subject;
	NSString* message;
}

@property (readwrite) NSNumber* localMessageId;
@property (readwrite) NSNumber* parentId;
@property (readwrite) NSNumber* forumId;
@property (readwrite) NSString* subject;
@property (readwrite) NSString* message;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface PostRatingInfo : BaseWSObject{
	NSNumber* localRatingId;
	NSNumber* messageId;
	NSNumber* rate;
}

@property (readwrite) NSNumber* localRatingId;
@property (readwrite) NSNumber* messageId;
@property (readwrite) NSNumber* rate;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface PostModerateInfo : BaseWSObject{
	NSNumber* localModerateId;
	NSNumber* messageId;
	NSString* moderateAction;
	NSNumber* moderateToForumId;
	NSString* description;
	NSNumber* asModerator;
}

@property (readwrite) NSNumber* localModerateId;
@property (readwrite) NSNumber* messageId;
@property (readwrite) NSString* moderateAction;
@property (readwrite) NSNumber* moderateToForumId;
@property (readwrite) NSString* description;
@property (readwrite) NSNumber* asModerator;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface PostExceptionInfo : BaseWSObject{
	NSString* exception;
	NSNumber* localMessageId;
	NSString* info;
}

@property (readwrite) NSString* exception;
@property (readwrite) NSNumber* localMessageId;
@property (readwrite) NSString* info;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface RatingExceptionInfo : BaseWSObject{
	NSString* exception;
	NSNumber* localRatingId;
	NSString* info;
}

@property (readwrite) NSString* exception;
@property (readwrite) NSNumber* localRatingId;
@property (readwrite) NSString* info;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface ModerateExceptionInfo : BaseWSObject{
	NSString* exceptionMessage;
	NSNumber* localModerateId;
	NSString* info;
}

@property (readwrite) NSString* exceptionMessage;
@property (readwrite) NSNumber* localModerateId;
@property (readwrite) NSString* info;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface TopicResponse : BaseWSObject{
	NSArray* messages;
	NSArray* rating;
	NSArray* moderate;
}

@property (readwrite) NSArray* messages;
@property (readwrite) NSArray* rating;
@property (readwrite) NSArray* moderate;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface ChangeRequest : BaseWSObject{
	NSString* userName;
	NSString* password;
	NSArray* subscribedForums;
	NSString* ratingRowVersion;
	NSString* messageRowVersion;
	NSString* moderateRowVersion;
	NSArray* breakMsgIds;
	NSArray* breakTopicIds;
	NSNumber* maxOutput;
}

@property (readwrite) NSString* userName;
@property (readwrite) NSString* password;
@property (readwrite) NSArray* subscribedForums;
@property (readwrite) NSString* ratingRowVersion;
@property (readwrite) NSString* messageRowVersion;
@property (readwrite) NSString* moderateRowVersion;
@property (readwrite) NSArray* breakMsgIds;
@property (readwrite) NSArray* breakTopicIds;
@property (readwrite) NSNumber* maxOutput;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface ChangeResponse : BaseWSObject{
	NSArray* nMessages;
	NSArray* nRating;
	NSArray* nModerate;
	NSString* lastRatingRowVersion;
	NSString* lastForumRowVersion;
	NSString* lastModerateRowVersion;
	NSNumber* userId;
}

@property (readwrite) NSArray* nMessages;
@property (readwrite) NSArray* nRating;
@property (readwrite) NSArray* nModerate;
@property (readwrite) NSString* lastRatingRowVersion;
@property (readwrite) NSString* lastForumRowVersion;
@property (readwrite) NSString* lastModerateRowVersion;
@property (readwrite) NSNumber* userId;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface ForumResponse : BaseWSObject{
	NSArray* forumList;
	NSArray* groupList;
	NSString* forumsRowVersion;
}

@property (readwrite) NSArray* forumList;
@property (readwrite) NSArray* groupList;
@property (readwrite) NSString* forumsRowVersion;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface UserResponse : BaseWSObject{
	NSString* lastRowVersion;
	NSArray* users;
}

@property (readwrite) NSString* lastRowVersion;
@property (readwrite) NSArray* users;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface PostRequest : BaseWSObject{
	NSString* userName;
	NSString* password;
	NSArray* writedMessages;
	NSArray* rates;
	NSArray* moderates;
}

@property (readwrite) NSString* userName;
@property (readwrite) NSString* password;
@property (readwrite) NSArray* writedMessages;
@property (readwrite) NSArray* rates;
@property (readwrite) NSArray* moderates;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface PostResponse : BaseWSObject{
	NSArray* commitedIds;
	NSArray* exceptions;
	NSArray* commitedRatingIds;
	NSArray* ratingExceptions;
	NSArray* commitedModerateIds;
	NSArray* moderateExceptions;
}

@property (readwrite) NSArray* commitedIds;
@property (readwrite) NSArray* exceptions;
@property (readwrite) NSArray* commitedRatingIds;
@property (readwrite) NSArray* ratingExceptions;
@property (readwrite) NSArray* commitedModerateIds;
@property (readwrite) NSArray* moderateExceptions;

-(NSXMLElement*) toXMLElement;
-(void) fillXML: (NSXMLElement*)e;
-(void) loadFrom: (NSXMLElement*) root;
+(id) objectByXML:(NSXMLElement*) root;

@end

@interface JanusAT: SoapWebService{
}

+(JanusAT*) service;


-(id) init;

-(TopicResponse*)GetTopicByMessage : (TopicRequest*) topicRequest error: (NSError**)pError;
-(ChangeResponse*)GetNewData : (ChangeRequest*) changeRequest error: (NSError**)pError;
-(ForumResponse*)GetForumList : (ForumRequest*) forumRequest error: (NSError**)pError;
-(UserResponse*)GetNewUsers : (UserRequest*) userRequest error: (NSError**)pError;

@end
