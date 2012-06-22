#import "rsdnClient.h"

@implementation TopicRequest

@synthesize userName;
@synthesize password;
@synthesize messageIds;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"TopicRequest"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(userName!=nil)
		if(userName!=nil){
			[NSWSDL addChild:e withName:@"userName" withValue: userName asAttribute:NO];
		}
	if(password!=nil)
		if(password!=nil){
			[NSWSDL addChild:e withName:@"password" withValue: password asAttribute:NO];
		}
	if(messageIds!=nil)
		[NSWSDL addChildArray:e withName:@"messageIds" withType:@"int" withArray:messageIds];
}


-(void) loadFrom: (NSXMLElement*) root{
	NSMutableArray* ary;
	NSXMLElement* e1;
	NSEnumerator* en;
	if(root==nil) return;
	[self setUserName: [NSWSDL getString:root:@"userName":NO]];
	[self setPassword: [NSWSDL getString:root:@"password":NO]];
	e1 = [NSWSDL getElement:root:@"messageIds"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [NSWSDL getNumber:e1:nil:NO] ];
		}
		[self setMessageIds: ary ];
	}
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	TopicRequest* obj = [[TopicRequest alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation JanusMessageInfo

@synthesize messageId;
@synthesize topicId;
@synthesize parentId;
@synthesize userId;
@synthesize forumId;
@synthesize subject;
@synthesize messageName;
@synthesize userNick;
@synthesize message;
@synthesize articleId;
@synthesize messageDate;
@synthesize updateDate;
@synthesize userRole;
@synthesize userTitle;
@synthesize userTitleColor;
@synthesize lastModerated;
@synthesize closed;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"JanusMessageInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(messageId!=nil)
		if(messageId!=nil){
			[NSWSDL addChild:e withName:@"messageId" withValue: [messageId stringValue] asAttribute:NO];
		}
	if(topicId!=nil)
		if(topicId!=nil){
			[NSWSDL addChild:e withName:@"topicId" withValue: [topicId stringValue] asAttribute:NO];
		}
	if(parentId!=nil)
		if(parentId!=nil){
			[NSWSDL addChild:e withName:@"parentId" withValue: [parentId stringValue] asAttribute:NO];
		}
	if(userId!=nil)
		if(userId!=nil){
			[NSWSDL addChild:e withName:@"userId" withValue: [userId stringValue] asAttribute:NO];
		}
	if(forumId!=nil)
		if(forumId!=nil){
			[NSWSDL addChild:e withName:@"forumId" withValue: [forumId stringValue] asAttribute:NO];
		}
	if(subject!=nil)
		if(subject!=nil){
			[NSWSDL addChild:e withName:@"subject" withValue: subject asAttribute:NO];
		}
	if(messageName!=nil)
		if(messageName!=nil){
			[NSWSDL addChild:e withName:@"messageName" withValue: messageName asAttribute:NO];
		}
	if(userNick!=nil)
		if(userNick!=nil){
			[NSWSDL addChild:e withName:@"userNick" withValue: userNick asAttribute:NO];
		}
	if(message!=nil)
		if(message!=nil){
			[NSWSDL addChild:e withName:@"message" withValue: message asAttribute:NO];
		}
	if(articleId!=nil)
		if(articleId!=nil){
			[NSWSDL addChild:e withName:@"articleId" withValue: [articleId stringValue] asAttribute:NO];
		}
	if(messageDate!=nil)
		if(messageDate!=nil){
			[NSWSDL addChild:e withName:@"messageDate" withValue: [NSWSDL toDateString:messageDate] asAttribute:NO];
		}
	if(updateDate!=nil)
		if(updateDate!=nil){
			[NSWSDL addChild:e withName:@"updateDate" withValue: [NSWSDL toDateString:updateDate] asAttribute:NO];
		}
	if(userRole!=nil)
		if(userRole!=nil){
			[NSWSDL addChild:e withName:@"userRole" withValue: userRole asAttribute:NO];
		}
	if(userTitle!=nil)
		if(userTitle!=nil){
			[NSWSDL addChild:e withName:@"userTitle" withValue: userTitle asAttribute:NO];
		}
	if(userTitleColor!=nil)
		if(userTitleColor!=nil){
			[NSWSDL addChild:e withName:@"userTitleColor" withValue: [userTitleColor stringValue] asAttribute:NO];
		}
	if(lastModerated!=nil)
		if(lastModerated!=nil){
			[NSWSDL addChild:e withName:@"lastModerated" withValue: [NSWSDL toDateString:lastModerated] asAttribute:NO];
		}
	if(closed!=nil)
		if(closed!=nil){
			[NSWSDL addChild:e withName:@"closed" withValue: [closed stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setMessageId: [NSWSDL getNumber:root:@"messageId":NO]];
	[self setTopicId: [NSWSDL getNumber:root:@"topicId":NO]];
	[self setParentId: [NSWSDL getNumber:root:@"parentId":NO]];
	[self setUserId: [NSWSDL getNumber:root:@"userId":NO]];
	[self setForumId: [NSWSDL getNumber:root:@"forumId":NO]];
	[self setSubject: [NSWSDL getString:root:@"subject":NO]];
	[self setMessageName: [NSWSDL getString:root:@"messageName":NO]];
	[self setUserNick: [NSWSDL getString:root:@"userNick":NO]];
	[self setMessage: [NSWSDL getString:root:@"message":NO]];
	[self setArticleId: [NSWSDL getNumber:root:@"articleId":NO]];
	[self setMessageDate: [NSWSDL getDate:root:@"messageDate":NO]];
	[self setUpdateDate: [NSWSDL getDate:root:@"updateDate":NO]];
	[self setUserRole: [NSWSDL getString:root:@"userRole":NO]];
	[self setUserTitle: [NSWSDL getString:root:@"userTitle":NO]];
	[self setUserTitleColor: [NSWSDL getNumber:root:@"userTitleColor":NO]];
	[self setLastModerated: [NSWSDL getDate:root:@"lastModerated":NO]];
	[self setClosed: [NSWSDL getBool:root:@"closed":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	JanusMessageInfo* obj = [[JanusMessageInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation JanusRatingInfo

@synthesize messageId;
@synthesize topicId;
@synthesize userId;
@synthesize userRating;
@synthesize rate;
@synthesize rateDate;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"JanusRatingInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(messageId!=nil)
		if(messageId!=nil){
			[NSWSDL addChild:e withName:@"messageId" withValue: [messageId stringValue] asAttribute:NO];
		}
	if(topicId!=nil)
		if(topicId!=nil){
			[NSWSDL addChild:e withName:@"topicId" withValue: [topicId stringValue] asAttribute:NO];
		}
	if(userId!=nil)
		if(userId!=nil){
			[NSWSDL addChild:e withName:@"userId" withValue: [userId stringValue] asAttribute:NO];
		}
	if(userRating!=nil)
		if(userRating!=nil){
			[NSWSDL addChild:e withName:@"userRating" withValue: [userRating stringValue] asAttribute:NO];
		}
	if(rate!=nil)
		if(rate!=nil){
			[NSWSDL addChild:e withName:@"rate" withValue: [rate stringValue] asAttribute:NO];
		}
	if(rateDate!=nil)
		if(rateDate!=nil){
			[NSWSDL addChild:e withName:@"rateDate" withValue: [NSWSDL toDateString:rateDate] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setMessageId: [NSWSDL getNumber:root:@"messageId":NO]];
	[self setTopicId: [NSWSDL getNumber:root:@"topicId":NO]];
	[self setUserId: [NSWSDL getNumber:root:@"userId":NO]];
	[self setUserRating: [NSWSDL getNumber:root:@"userRating":NO]];
	[self setRate: [NSWSDL getNumber:root:@"rate":NO]];
	[self setRateDate: [NSWSDL getDate:root:@"rateDate":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	JanusRatingInfo* obj = [[JanusRatingInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation JanusModerateInfo

@synthesize messageId;
@synthesize topicId;
@synthesize userId;
@synthesize forumId;
@synthesize create;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"JanusModerateInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(messageId!=nil)
		if(messageId!=nil){
			[NSWSDL addChild:e withName:@"messageId" withValue: [messageId stringValue] asAttribute:NO];
		}
	if(topicId!=nil)
		if(topicId!=nil){
			[NSWSDL addChild:e withName:@"topicId" withValue: [topicId stringValue] asAttribute:NO];
		}
	if(userId!=nil)
		if(userId!=nil){
			[NSWSDL addChild:e withName:@"userId" withValue: [userId stringValue] asAttribute:NO];
		}
	if(forumId!=nil)
		if(forumId!=nil){
			[NSWSDL addChild:e withName:@"forumId" withValue: [forumId stringValue] asAttribute:NO];
		}
	if(create!=nil)
		if(create!=nil){
			[NSWSDL addChild:e withName:@"create" withValue: [NSWSDL toDateString:create] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setMessageId: [NSWSDL getNumber:root:@"messageId":NO]];
	[self setTopicId: [NSWSDL getNumber:root:@"topicId":NO]];
	[self setUserId: [NSWSDL getNumber:root:@"userId":NO]];
	[self setForumId: [NSWSDL getNumber:root:@"forumId":NO]];
	[self setCreate: [NSWSDL getDate:root:@"create":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	JanusModerateInfo* obj = [[JanusModerateInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation RequestForumInfo

@synthesize forumId;
@synthesize isFirstRequest;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"RequestForumInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(forumId!=nil)
		if(forumId!=nil){
			[NSWSDL addChild:e withName:@"forumId" withValue: [forumId stringValue] asAttribute:NO];
		}
	if(isFirstRequest!=nil)
		if(isFirstRequest!=nil){
			[NSWSDL addChild:e withName:@"isFirstRequest" withValue: [isFirstRequest stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setForumId: [NSWSDL getNumber:root:@"forumId":NO]];
	[self setIsFirstRequest: [NSWSDL getBool:root:@"isFirstRequest":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	RequestForumInfo* obj = [[RequestForumInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation ForumRequest

@synthesize userName;
@synthesize password;
@synthesize forumsRowVersion;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"ForumRequest"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(userName!=nil)
		if(userName!=nil){
			[NSWSDL addChild:e withName:@"userName" withValue: userName asAttribute:NO];
		}
	if(password!=nil)
		if(password!=nil){
			[NSWSDL addChild:e withName:@"password" withValue: password asAttribute:NO];
		}
	if(forumsRowVersion!=nil)
		if(forumsRowVersion!=nil){
			[NSWSDL addChild:e withName:@"forumsRowVersion" withValue: forumsRowVersion asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setUserName: [NSWSDL getString:root:@"userName":NO]];
	[self setPassword: [NSWSDL getString:root:@"password":NO]];
	[self setForumsRowVersion: [NSWSDL getString:root:@"forumsRowVersion":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	ForumRequest* obj = [[ForumRequest alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation JanusForumInfo

@synthesize forumId;
@synthesize forumGroupId;
@synthesize shortForumName;
@synthesize forumName;
@synthesize rated;
@synthesize inTop;
@synthesize rateLimit;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"JanusForumInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(forumId!=nil)
		if(forumId!=nil){
			[NSWSDL addChild:e withName:@"forumId" withValue: [forumId stringValue] asAttribute:NO];
		}
	if(forumGroupId!=nil)
		if(forumGroupId!=nil){
			[NSWSDL addChild:e withName:@"forumGroupId" withValue: [forumGroupId stringValue] asAttribute:NO];
		}
	if(shortForumName!=nil)
		if(shortForumName!=nil){
			[NSWSDL addChild:e withName:@"shortForumName" withValue: shortForumName asAttribute:NO];
		}
	if(forumName!=nil)
		if(forumName!=nil){
			[NSWSDL addChild:e withName:@"forumName" withValue: forumName asAttribute:NO];
		}
	if(rated!=nil)
		if(rated!=nil){
			[NSWSDL addChild:e withName:@"rated" withValue: [rated stringValue] asAttribute:NO];
		}
	if(inTop!=nil)
		if(inTop!=nil){
			[NSWSDL addChild:e withName:@"inTop" withValue: [inTop stringValue] asAttribute:NO];
		}
	if(rateLimit!=nil)
		if(rateLimit!=nil){
			[NSWSDL addChild:e withName:@"rateLimit" withValue: [rateLimit stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setForumId: [NSWSDL getNumber:root:@"forumId":NO]];
	[self setForumGroupId: [NSWSDL getNumber:root:@"forumGroupId":NO]];
	[self setShortForumName: [NSWSDL getString:root:@"shortForumName":NO]];
	[self setForumName: [NSWSDL getString:root:@"forumName":NO]];
	[self setRated: [NSWSDL getNumber:root:@"rated":NO]];
	[self setInTop: [NSWSDL getNumber:root:@"inTop":NO]];
	[self setRateLimit: [NSWSDL getNumber:root:@"rateLimit":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	JanusForumInfo* obj = [[JanusForumInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation JanusForumGroupInfo

@synthesize forumGroupId;
@synthesize forumGroupName;
@synthesize sortOrder;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"JanusForumGroupInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(forumGroupId!=nil)
		if(forumGroupId!=nil){
			[NSWSDL addChild:e withName:@"forumGroupId" withValue: [forumGroupId stringValue] asAttribute:NO];
		}
	if(forumGroupName!=nil)
		if(forumGroupName!=nil){
			[NSWSDL addChild:e withName:@"forumGroupName" withValue: forumGroupName asAttribute:NO];
		}
	if(sortOrder!=nil)
		if(sortOrder!=nil){
			[NSWSDL addChild:e withName:@"sortOrder" withValue: [sortOrder stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setForumGroupId: [NSWSDL getNumber:root:@"forumGroupId":NO]];
	[self setForumGroupName: [NSWSDL getString:root:@"forumGroupName":NO]];
	[self setSortOrder: [NSWSDL getNumber:root:@"sortOrder":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	JanusForumGroupInfo* obj = [[JanusForumGroupInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation UserRequest

@synthesize userName;
@synthesize password;
@synthesize lastRowVersion;
@synthesize maxOutput;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"UserRequest"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(userName!=nil)
		if(userName!=nil){
			[NSWSDL addChild:e withName:@"userName" withValue: userName asAttribute:NO];
		}
	if(password!=nil)
		if(password!=nil){
			[NSWSDL addChild:e withName:@"password" withValue: password asAttribute:NO];
		}
	if(lastRowVersion!=nil)
		if(lastRowVersion!=nil){
			[NSWSDL addChild:e withName:@"lastRowVersion" withValue: lastRowVersion asAttribute:NO];
		}
	if(maxOutput!=nil)
		if(maxOutput!=nil){
			[NSWSDL addChild:e withName:@"maxOutput" withValue: [maxOutput stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setUserName: [NSWSDL getString:root:@"userName":NO]];
	[self setPassword: [NSWSDL getString:root:@"password":NO]];
	[self setLastRowVersion: [NSWSDL getString:root:@"lastRowVersion":NO]];
	[self setMaxOutput: [NSWSDL getNumber:root:@"maxOutput":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	UserRequest* obj = [[UserRequest alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation JanusUserInfo

@synthesize userId;
@synthesize userName;
@synthesize userNick;
@synthesize realName;
@synthesize publicEmail;
@synthesize homePage;
@synthesize specialization;
@synthesize whereFrom;
@synthesize origin;
@synthesize userClass;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"JanusUserInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(userId!=nil)
		if(userId!=nil){
			[NSWSDL addChild:e withName:@"userId" withValue: [userId stringValue] asAttribute:NO];
		}
	if(userName!=nil)
		if(userName!=nil){
			[NSWSDL addChild:e withName:@"userName" withValue: userName asAttribute:NO];
		}
	if(userNick!=nil)
		if(userNick!=nil){
			[NSWSDL addChild:e withName:@"userNick" withValue: userNick asAttribute:NO];
		}
	if(realName!=nil)
		if(realName!=nil){
			[NSWSDL addChild:e withName:@"realName" withValue: realName asAttribute:NO];
		}
	if(publicEmail!=nil)
		if(publicEmail!=nil){
			[NSWSDL addChild:e withName:@"publicEmail" withValue: publicEmail asAttribute:NO];
		}
	if(homePage!=nil)
		if(homePage!=nil){
			[NSWSDL addChild:e withName:@"homePage" withValue: homePage asAttribute:NO];
		}
	if(specialization!=nil)
		if(specialization!=nil){
			[NSWSDL addChild:e withName:@"specialization" withValue: specialization asAttribute:NO];
		}
	if(whereFrom!=nil)
		if(whereFrom!=nil){
			[NSWSDL addChild:e withName:@"whereFrom" withValue: whereFrom asAttribute:NO];
		}
	if(origin!=nil)
		if(origin!=nil){
			[NSWSDL addChild:e withName:@"origin" withValue: origin asAttribute:NO];
		}
	if(userClass!=nil)
		if(userClass!=nil){
			[NSWSDL addChild:e withName:@"userClass" withValue: [userClass stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setUserId: [NSWSDL getNumber:root:@"userId":NO]];
	[self setUserName: [NSWSDL getString:root:@"userName":NO]];
	[self setUserNick: [NSWSDL getString:root:@"userNick":NO]];
	[self setRealName: [NSWSDL getString:root:@"realName":NO]];
	[self setPublicEmail: [NSWSDL getString:root:@"publicEmail":NO]];
	[self setHomePage: [NSWSDL getString:root:@"homePage":NO]];
	[self setSpecialization: [NSWSDL getString:root:@"specialization":NO]];
	[self setWhereFrom: [NSWSDL getString:root:@"whereFrom":NO]];
	[self setOrigin: [NSWSDL getString:root:@"origin":NO]];
	[self setUserClass: [NSWSDL getNumber:root:@"userClass":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	JanusUserInfo* obj = [[JanusUserInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation PostMessageInfo

@synthesize localMessageId;
@synthesize parentId;
@synthesize forumId;
@synthesize subject;
@synthesize message;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"PostMessageInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(localMessageId!=nil)
		if(localMessageId!=nil){
			[NSWSDL addChild:e withName:@"localMessageId" withValue: [localMessageId stringValue] asAttribute:NO];
		}
	if(parentId!=nil)
		if(parentId!=nil){
			[NSWSDL addChild:e withName:@"parentId" withValue: [parentId stringValue] asAttribute:NO];
		}
	if(forumId!=nil)
		if(forumId!=nil){
			[NSWSDL addChild:e withName:@"forumId" withValue: [forumId stringValue] asAttribute:NO];
		}
	if(subject!=nil)
		if(subject!=nil){
			[NSWSDL addChild:e withName:@"subject" withValue: subject asAttribute:NO];
		}
	if(message!=nil)
		if(message!=nil){
			[NSWSDL addChild:e withName:@"message" withValue: message asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setLocalMessageId: [NSWSDL getNumber:root:@"localMessageId":NO]];
	[self setParentId: [NSWSDL getNumber:root:@"parentId":NO]];
	[self setForumId: [NSWSDL getNumber:root:@"forumId":NO]];
	[self setSubject: [NSWSDL getString:root:@"subject":NO]];
	[self setMessage: [NSWSDL getString:root:@"message":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	PostMessageInfo* obj = [[PostMessageInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation PostRatingInfo

@synthesize localRatingId;
@synthesize messageId;
@synthesize rate;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"PostRatingInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(localRatingId!=nil)
		if(localRatingId!=nil){
			[NSWSDL addChild:e withName:@"localRatingId" withValue: [localRatingId stringValue] asAttribute:NO];
		}
	if(messageId!=nil)
		if(messageId!=nil){
			[NSWSDL addChild:e withName:@"messageId" withValue: [messageId stringValue] asAttribute:NO];
		}
	if(rate!=nil)
		if(rate!=nil){
			[NSWSDL addChild:e withName:@"rate" withValue: [rate stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setLocalRatingId: [NSWSDL getNumber:root:@"localRatingId":NO]];
	[self setMessageId: [NSWSDL getNumber:root:@"messageId":NO]];
	[self setRate: [NSWSDL getNumber:root:@"rate":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	PostRatingInfo* obj = [[PostRatingInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation PostModerateInfo

@synthesize localModerateId;
@synthesize messageId;
@synthesize moderateAction;
@synthesize moderateToForumId;
@synthesize description;
@synthesize asModerator;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"PostModerateInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(localModerateId!=nil)
		if(localModerateId!=nil){
			[NSWSDL addChild:e withName:@"LocalModerateId" withValue: [localModerateId stringValue] asAttribute:NO];
		}
	if(messageId!=nil)
		if(messageId!=nil){
			[NSWSDL addChild:e withName:@"MessageId" withValue: [messageId stringValue] asAttribute:NO];
		}
	if(moderateAction!=nil)
		if(moderateAction!=nil){
			[NSWSDL addChild:e withName:@"ModerateAction" withValue: moderateAction asAttribute:NO];
		}
	if(moderateToForumId!=nil)
		if(moderateToForumId!=nil){
			[NSWSDL addChild:e withName:@"ModerateToForumId" withValue: [moderateToForumId stringValue] asAttribute:NO];
		}
	if(description!=nil)
		if(description!=nil){
			[NSWSDL addChild:e withName:@"Description" withValue: description asAttribute:NO];
		}
	if(asModerator!=nil)
		if(asModerator!=nil){
			[NSWSDL addChild:e withName:@"AsModerator" withValue: [asModerator stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setLocalModerateId: [NSWSDL getNumber:root:@"LocalModerateId":NO]];
	[self setMessageId: [NSWSDL getNumber:root:@"MessageId":NO]];
	[self setModerateAction: [NSWSDL getString:root:@"ModerateAction":NO]];
	[self setModerateToForumId: [NSWSDL getNumber:root:@"ModerateToForumId":NO]];
	[self setDescription: [NSWSDL getString:root:@"Description":NO]];
	[self setAsModerator: [NSWSDL getBool:root:@"AsModerator":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	PostModerateInfo* obj = [[PostModerateInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation PostExceptionInfo

@synthesize exception;
@synthesize localMessageId;
@synthesize info;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"PostExceptionInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(exception!=nil)
		if(exception!=nil){
			[NSWSDL addChild:e withName:@"exception" withValue: exception asAttribute:NO];
		}
	if(localMessageId!=nil)
		if(localMessageId!=nil){
			[NSWSDL addChild:e withName:@"localMessageId" withValue: [localMessageId stringValue] asAttribute:NO];
		}
	if(info!=nil)
		if(info!=nil){
			[NSWSDL addChild:e withName:@"info" withValue: info asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setException: [NSWSDL getString:root:@"exception":NO]];
	[self setLocalMessageId: [NSWSDL getNumber:root:@"localMessageId":NO]];
	[self setInfo: [NSWSDL getString:root:@"info":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	PostExceptionInfo* obj = [[PostExceptionInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation RatingExceptionInfo

@synthesize exception;
@synthesize localRatingId;
@synthesize info;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"RatingExceptionInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(exception!=nil)
		if(exception!=nil){
			[NSWSDL addChild:e withName:@"exception" withValue: exception asAttribute:NO];
		}
	if(localRatingId!=nil)
		if(localRatingId!=nil){
			[NSWSDL addChild:e withName:@"localRatingId" withValue: [localRatingId stringValue] asAttribute:NO];
		}
	if(info!=nil)
		if(info!=nil){
			[NSWSDL addChild:e withName:@"info" withValue: info asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setException: [NSWSDL getString:root:@"exception":NO]];
	[self setLocalRatingId: [NSWSDL getNumber:root:@"localRatingId":NO]];
	[self setInfo: [NSWSDL getString:root:@"info":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	RatingExceptionInfo* obj = [[RatingExceptionInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation ModerateExceptionInfo

@synthesize exceptionMessage;
@synthesize localModerateId;
@synthesize info;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"ModerateExceptionInfo"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(exceptionMessage!=nil)
		if(exceptionMessage!=nil){
			[NSWSDL addChild:e withName:@"ExceptionMessage" withValue: exceptionMessage asAttribute:NO];
		}
	if(localModerateId!=nil)
		if(localModerateId!=nil){
			[NSWSDL addChild:e withName:@"LocalModerateId" withValue: [localModerateId stringValue] asAttribute:NO];
		}
	if(info!=nil)
		if(info!=nil){
			[NSWSDL addChild:e withName:@"Info" withValue: info asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	if(root==nil) return;
	[self setExceptionMessage: [NSWSDL getString:root:@"ExceptionMessage":NO]];
	[self setLocalModerateId: [NSWSDL getNumber:root:@"LocalModerateId":NO]];
	[self setInfo: [NSWSDL getString:root:@"Info":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	ModerateExceptionInfo* obj = [[ModerateExceptionInfo alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation TopicResponse

@synthesize messages;
@synthesize rating;
@synthesize moderate;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"TopicResponse"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(messages!=nil)
		[NSWSDL addChildArray:e withName:@"Messages" withType:nil withArray:messages];
	if(rating!=nil)
		[NSWSDL addChildArray:e withName:@"Rating" withType:nil withArray:rating];
	if(moderate!=nil)
		[NSWSDL addChildArray:e withName:@"Moderate" withType:nil withArray:moderate];
}


-(void) loadFrom: (NSXMLElement*) root{
	NSMutableArray* ary;
	NSXMLElement* e1;
	NSEnumerator* en;
	if(root==nil) return;
	e1 = [NSWSDL getElement:root:@"Messages"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusMessageInfo objectByXML:e1]];
		}
		[self setMessages: ary ];
	}
	e1 = [NSWSDL getElement:root:@"Rating"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusRatingInfo objectByXML:e1]];
		}
		[self setRating: ary ];
	}
	e1 = [NSWSDL getElement:root:@"Moderate"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusModerateInfo objectByXML:e1]];
		}
		[self setModerate: ary ];
	}
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	TopicResponse* obj = [[TopicResponse alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation ChangeRequest

@synthesize userName;
@synthesize password;
@synthesize subscribedForums;
@synthesize ratingRowVersion;
@synthesize messageRowVersion;
@synthesize moderateRowVersion;
@synthesize breakMsgIds;
@synthesize breakTopicIds;
@synthesize maxOutput;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"ChangeRequest"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(userName!=nil)
		if(userName!=nil){
			[NSWSDL addChild:e withName:@"userName" withValue: userName asAttribute:NO];
		}
	if(password!=nil)
		if(password!=nil){
			[NSWSDL addChild:e withName:@"password" withValue: password asAttribute:NO];
		}
	if(subscribedForums!=nil)
		[NSWSDL addChildArray:e withName:@"subscribedForums" withType:nil withArray:subscribedForums];
	if(ratingRowVersion!=nil)
		if(ratingRowVersion!=nil){
			[NSWSDL addChild:e withName:@"ratingRowVersion" withValue: ratingRowVersion asAttribute:NO];
		}
	if(messageRowVersion!=nil)
		if(messageRowVersion!=nil){
			[NSWSDL addChild:e withName:@"messageRowVersion" withValue: messageRowVersion asAttribute:NO];
		}
	if(moderateRowVersion!=nil)
		if(moderateRowVersion!=nil){
			[NSWSDL addChild:e withName:@"moderateRowVersion" withValue: moderateRowVersion asAttribute:NO];
		}
	if(breakMsgIds!=nil)
		[NSWSDL addChildArray:e withName:@"breakMsgIds" withType:@"int" withArray:breakMsgIds];
	if(breakTopicIds!=nil)
		[NSWSDL addChildArray:e withName:@"breakTopicIds" withType:@"int" withArray:breakTopicIds];
	if(maxOutput!=nil)
		if(maxOutput!=nil){
			[NSWSDL addChild:e withName:@"maxOutput" withValue: [maxOutput stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	NSMutableArray* ary;
	NSXMLElement* e1;
	NSEnumerator* en;
	if(root==nil) return;
	[self setUserName: [NSWSDL getString:root:@"userName":NO]];
	[self setPassword: [NSWSDL getString:root:@"password":NO]];
	e1 = [NSWSDL getElement:root:@"subscribedForums"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [RequestForumInfo objectByXML:e1]];
		}
		[self setSubscribedForums: ary ];
	}
	[self setRatingRowVersion: [NSWSDL getString:root:@"ratingRowVersion":NO]];
	[self setMessageRowVersion: [NSWSDL getString:root:@"messageRowVersion":NO]];
	[self setModerateRowVersion: [NSWSDL getString:root:@"moderateRowVersion":NO]];
	e1 = [NSWSDL getElement:root:@"breakMsgIds"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [NSWSDL getNumber:e1:nil:NO] ];
		}
		[self setBreakMsgIds: ary ];
	}
	e1 = [NSWSDL getElement:root:@"breakTopicIds"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [NSWSDL getNumber:e1:nil:NO] ];
		}
		[self setBreakTopicIds: ary ];
	}
	[self setMaxOutput: [NSWSDL getNumber:root:@"maxOutput":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	ChangeRequest* obj = [[ChangeRequest alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation ChangeResponse

@synthesize nMessages;
@synthesize nRating;
@synthesize nModerate;
@synthesize lastRatingRowVersion;
@synthesize lastForumRowVersion;
@synthesize lastModerateRowVersion;
@synthesize userId;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"ChangeResponse"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(nMessages!=nil)
		[NSWSDL addChildArray:e withName:@"newMessages" withType:nil withArray:nMessages];
	if(nRating!=nil)
		[NSWSDL addChildArray:e withName:@"newRating" withType:nil withArray:nRating];
	if(nModerate!=nil)
		[NSWSDL addChildArray:e withName:@"newModerate" withType:nil withArray:nModerate];
	if(lastRatingRowVersion!=nil)
		if(lastRatingRowVersion!=nil){
			[NSWSDL addChild:e withName:@"lastRatingRowVersion" withValue: lastRatingRowVersion asAttribute:NO];
		}
	if(lastForumRowVersion!=nil)
		if(lastForumRowVersion!=nil){
			[NSWSDL addChild:e withName:@"lastForumRowVersion" withValue: lastForumRowVersion asAttribute:NO];
		}
	if(lastModerateRowVersion!=nil)
		if(lastModerateRowVersion!=nil){
			[NSWSDL addChild:e withName:@"lastModerateRowVersion" withValue: lastModerateRowVersion asAttribute:NO];
		}
	if(userId!=nil)
		if(userId!=nil){
			[NSWSDL addChild:e withName:@"userId" withValue: [userId stringValue] asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	NSMutableArray* ary;
	NSXMLElement* e1;
	NSEnumerator* en;
	if(root==nil) return;
	e1 = [NSWSDL getElement:root:@"newMessages"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusMessageInfo objectByXML:e1]];
		}
		[self setNMessages: ary ];
	}
	e1 = [NSWSDL getElement:root:@"newRating"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusRatingInfo objectByXML:e1]];
		}
		[self setNRating: ary ];
	}
	e1 = [NSWSDL getElement:root:@"newModerate"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusModerateInfo objectByXML:e1]];
		}
		[self setNModerate: ary ];
	}
	[self setLastRatingRowVersion: [NSWSDL getString:root:@"lastRatingRowVersion":NO]];
	[self setLastForumRowVersion: [NSWSDL getString:root:@"lastForumRowVersion":NO]];
	[self setLastModerateRowVersion: [NSWSDL getString:root:@"lastModerateRowVersion":NO]];
	[self setUserId: [NSWSDL getNumber:root:@"userId":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	ChangeResponse* obj = [[ChangeResponse alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation ForumResponse

@synthesize forumList;
@synthesize groupList;
@synthesize forumsRowVersion;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"ForumResponse"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(forumList!=nil)
		[NSWSDL addChildArray:e withName:@"forumList" withType:nil withArray:forumList];
	if(groupList!=nil)
		[NSWSDL addChildArray:e withName:@"groupList" withType:nil withArray:groupList];
	if(forumsRowVersion!=nil)
		if(forumsRowVersion!=nil){
			[NSWSDL addChild:e withName:@"forumsRowVersion" withValue: forumsRowVersion asAttribute:NO];
		}
}


-(void) loadFrom: (NSXMLElement*) root{
	NSMutableArray* ary;
	NSXMLElement* e1;
	NSEnumerator* en;
	if(root==nil) return;
	e1 = [NSWSDL getElement:root:@"forumList"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusForumInfo objectByXML:e1]];
		}
		[self setForumList: ary ];
	}
	e1 = [NSWSDL getElement:root:@"groupList"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusForumGroupInfo objectByXML:e1]];
		}
		[self setGroupList: ary ];
	}
	[self setForumsRowVersion: [NSWSDL getString:root:@"forumsRowVersion":NO]];
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	ForumResponse* obj = [[ForumResponse alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation UserResponse

@synthesize lastRowVersion;
@synthesize users;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"UserResponse"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(lastRowVersion!=nil)
		if(lastRowVersion!=nil){
			[NSWSDL addChild:e withName:@"lastRowVersion" withValue: lastRowVersion asAttribute:NO];
		}
	if(users!=nil)
		[NSWSDL addChildArray:e withName:@"users" withType:nil withArray:users];
}


-(void) loadFrom: (NSXMLElement*) root{
	NSMutableArray* ary;
	NSXMLElement* e1;
	NSEnumerator* en;
	if(root==nil) return;
	[self setLastRowVersion: [NSWSDL getString:root:@"lastRowVersion":NO]];
	e1 = [NSWSDL getElement:root:@"users"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [JanusUserInfo objectByXML:e1]];
		}
		[self setUsers: ary ];
	}
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	UserResponse* obj = [[UserResponse alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation PostRequest

@synthesize userName;
@synthesize password;
@synthesize writedMessages;
@synthesize rates;
@synthesize moderates;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"PostRequest"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(userName!=nil)
		if(userName!=nil){
			[NSWSDL addChild:e withName:@"userName" withValue: userName asAttribute:NO];
		}
	if(password!=nil)
		if(password!=nil){
			[NSWSDL addChild:e withName:@"password" withValue: password asAttribute:NO];
		}
	if(writedMessages!=nil)
		[NSWSDL addChildArray:e withName:@"writedMessages" withType:nil withArray:writedMessages];
	if(rates!=nil)
		[NSWSDL addChildArray:e withName:@"rates" withType:nil withArray:rates];
	if(moderates!=nil)
		[NSWSDL addChildArray:e withName:@"moderates" withType:nil withArray:moderates];
}


-(void) loadFrom: (NSXMLElement*) root{
	NSMutableArray* ary;
	NSXMLElement* e1;
	NSEnumerator* en;
	if(root==nil) return;
	[self setUserName: [NSWSDL getString:root:@"userName":NO]];
	[self setPassword: [NSWSDL getString:root:@"password":NO]];
	e1 = [NSWSDL getElement:root:@"writedMessages"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [PostMessageInfo objectByXML:e1]];
		}
		[self setWritedMessages: ary ];
	}
	e1 = [NSWSDL getElement:root:@"rates"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [PostRatingInfo objectByXML:e1]];
		}
		[self setRates: ary ];
	}
	e1 = [NSWSDL getElement:root:@"moderates"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [PostModerateInfo objectByXML:e1]];
		}
		[self setModerates: ary ];
	}
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	PostRequest* obj = [[PostRequest alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation PostResponse

@synthesize commitedIds;
@synthesize exceptions;
@synthesize commitedRatingIds;
@synthesize ratingExceptions;
@synthesize commitedModerateIds;
@synthesize moderateExceptions;




-(NSXMLElement*) toXMLElement{
	NSXMLElement* e = [NSXMLElement elementWithName:@"PostResponse"];
	[self fillXML:e];
	return e;
}


-(void) fillXML:(NSXMLElement*) e{
	if(commitedIds!=nil)
		[NSWSDL addChildArray:e withName:@"commitedIds" withType:@"int" withArray:commitedIds];
	if(exceptions!=nil)
		[NSWSDL addChildArray:e withName:@"exceptions" withType:nil withArray:exceptions];
	if(commitedRatingIds!=nil)
		[NSWSDL addChildArray:e withName:@"commitedRatingIds" withType:@"int" withArray:commitedRatingIds];
	if(ratingExceptions!=nil)
		[NSWSDL addChildArray:e withName:@"ratingExceptions" withType:nil withArray:ratingExceptions];
	if(commitedModerateIds!=nil)
		[NSWSDL addChildArray:e withName:@"commitedModerateIds" withType:@"int" withArray:commitedModerateIds];
	if(moderateExceptions!=nil)
		[NSWSDL addChildArray:e withName:@"moderateExceptions" withType:nil withArray:moderateExceptions];
}


-(void) loadFrom: (NSXMLElement*) root{
	NSMutableArray* ary;
	NSXMLElement* e1;
	NSEnumerator* en;
	if(root==nil) return;
	e1 = [NSWSDL getElement:root:@"commitedIds"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [NSWSDL getNumber:e1:nil:NO] ];
		}
		[self setCommitedIds: ary ];
	}
	e1 = [NSWSDL getElement:root:@"exceptions"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [PostExceptionInfo objectByXML:e1]];
		}
		[self setExceptions: ary ];
	}
	e1 = [NSWSDL getElement:root:@"commitedRatingIds"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [NSWSDL getNumber:e1:nil:NO] ];
		}
		[self setCommitedRatingIds: ary ];
	}
	e1 = [NSWSDL getElement:root:@"ratingExceptions"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [RatingExceptionInfo objectByXML:e1]];
		}
		[self setRatingExceptions: ary ];
	}
	e1 = [NSWSDL getElement:root:@"commitedModerateIds"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [NSWSDL getNumber:e1:nil:NO] ];
		}
		[self setCommitedModerateIds: ary ];
	}
	e1 = [NSWSDL getElement:root:@"moderateExceptions"];
	if(e1 != nil){
		en = [[e1 children] objectEnumerator];
		ary = [NSMutableArray arrayWithCapacity:10];
		while((e1 = [en nextObject])){
			[ary addObject: [ModerateExceptionInfo objectByXML:e1]];
		}
		[self setModerateExceptions: ary ];
	}
}

+(id) objectByXML:(NSXMLElement*) root{
	if(root==nil) return nil;
	PostResponse* obj = [[PostResponse alloc] init];
	[obj loadFrom:root];
	return obj;
}

@end


@implementation JanusAT



+(JanusAT*) service{
	return [[JanusAT alloc] init];
}

-(id) init{
	if(!(self = [super init])) return nil;
	[self set__url: @"http://www.rsdn.ru/ws/janusAT.asmx"];
	return self;
}


-(TopicResponse*)GetTopicByMessage : (TopicRequest*) topicRequest error: (NSError**)pError{
	[NSWSDL setBusy:YES];
	SoapRequest* _req;
	_req = [self buildSoapRequest: @"GetTopicByMessage" withNS: @"http://rsdn.ru/Janus/" withAction: @"http://rsdn.ru/Janus/GetTopicByMessage" withHeader: nil error:pError];
	if(_req==nil) return nil;
	NSXMLElement * _method = [_req method];
	[NSWSDL addChildNode:_method withName:@"topicRequest" withElement:nil withObject:topicRequest ];
	
	SoapResponse* _resp = [self getSoapResponse: _req error:pError];
	if(_resp==nil) return nil;
	NSXMLElement* _body = [_resp body];
	id retVal = [TopicResponse objectByXML:_body];
	[NSWSDL setBusy:NO];
	return retVal;
}

-(ChangeResponse*)GetNewData : (ChangeRequest*) changeRequest error: (NSError**)pError{
	[NSWSDL setBusy:YES];
	SoapRequest* _req;
	_req = [self buildSoapRequest: @"GetNewData" withNS: @"http://rsdn.ru/Janus/" withAction: @"http://rsdn.ru/Janus/GetNewData" withHeader: nil error:pError];
	if(_req==nil) return nil;
	NSXMLElement * _method = [_req method];
	[NSWSDL addChildNode:_method withName:@"changeRequest" withElement:nil withObject:changeRequest ];
	
	SoapResponse* _resp = [self getSoapResponse: _req error:pError];
	if(_resp==nil) return nil;
	NSXMLElement* _body = [_resp body];
	id retVal = [ChangeResponse objectByXML:_body];
	[NSWSDL setBusy:NO];
	return retVal;
}

-(ForumResponse*)GetForumList : (ForumRequest*) forumRequest error: (NSError**)pError{
	[NSWSDL setBusy:YES];
	SoapRequest* _req;
	_req = [self buildSoapRequest: @"GetForumList" withNS: @"http://rsdn.ru/Janus/" withAction: @"http://rsdn.ru/Janus/GetForumList" withHeader: nil error:pError];
	if(_req==nil) return nil;
	NSXMLElement * _method = [_req method];
	[NSWSDL addChildNode:_method withName:@"forumRequest" withElement:nil withObject:forumRequest ];
	
	SoapResponse* _resp = [self getSoapResponse: _req error:pError];
	if(_resp==nil) return nil;
	NSXMLElement* _body = [_resp body];
	id retVal = [ForumResponse objectByXML:_body];
	[NSWSDL setBusy:NO];
	return retVal;
}

-(UserResponse*)GetNewUsers : (UserRequest*) userRequest error: (NSError**)pError{
	[NSWSDL setBusy:YES];
	SoapRequest* _req;
	_req = [self buildSoapRequest: @"GetNewUsers" withNS: @"http://rsdn.ru/Janus/" withAction: @"http://rsdn.ru/Janus/GetNewUsers" withHeader: nil error:pError];
	if(_req==nil) return nil;
	NSXMLElement * _method = [_req method];
	[NSWSDL addChildNode:_method withName:@"userRequest" withElement:nil withObject:userRequest ];
	
	SoapResponse* _resp = [self getSoapResponse: _req error:pError];
	if(_resp==nil) return nil;
	NSXMLElement* _body = [_resp body];
	id retVal = [UserResponse objectByXML:_body];
	[NSWSDL setBusy:NO];
	return retVal;
}

@end

