/*
	JanusAT.h
	The interface definition of classes and methods for the JanusAT web service.
	Generated by SudzC.com
*/
				
#import "Soap.h"
	
/* Add class references */
				
#import "RequestForumInfo.h"
#import "ArrayOfInt.h"
#import "JanusRatingInfo.h"
#import "JanusModerateInfo.h"
#import "ForumRequest.h"
#import "JanusForumInfo.h"
#import "JanusForumGroupInfo.h"
#import "UserRequest.h"
#import "JanusUserInfo.h"
#import "PostMessageInfo.h"
#import "PostRatingInfo.h"
#import "PostExceptionInfo.h"
#import "RatingExceptionInfo.h"
#import "ModerateExceptionInfo.h"
#import "ViolationRequest.h"
#import "ArrayOfRequestForumInfo.h"
#import "ViolationResponse.h"
#import "ArrayOfJanusViolationInfo.h"
#import "JanusViolationInfo.h"
#import "TopicRequest.h"
#import "ArrayOfJanusMessageInfo.h"
#import "JanusMessageInfo.h"
#import "ArrayOfJanusRatingInfo.h"
#import "ArrayOfJanusModerateInfo.h"
#import "ArrayOfJanusForumInfo.h"
#import "ArrayOfJanusForumGroupInfo.h"
#import "UserResponse.h"
#import "ArrayOfJanusUserInfo.h"
#import "UserByIdsRequest.h"
#import "ArrayOfPostMessageInfo.h"
#import "ArrayOfPostRatingInfo.h"
#import "ArrayOfPostModerateInfo.h"
#import "PostModerateInfo.h"
#import "ArrayOfPostExceptionInfo.h"
#import "ArrayOfRatingExceptionInfo.h"
#import "ArrayOfModerateExceptionInfo.h"
#import "ForumResponse.h"
#import "TopicResponse.h"
#import "ChangeRequest.h"
#import "ChangeResponse.h"
#import "PostRequest.h"
#import "PostResponse.h"

/* Interface for the service */
				
@interface JanusAT : SoapService
		
	/* Returns ViolationResponse*. ?????????? ????? ????????? ? ?????????? */
	- (SoapRequest*) GetNewViolations: (id <SoapDelegate>) handler request: (ViolationRequest*) request;
	- (SoapRequest*) GetNewViolations: (id) target action: (SEL) action request: (ViolationRequest*) request;

	/* Returns TopicResponse*. ??????????? ??????? ?? ID ????????? */
	- (SoapRequest*) GetTopicByMessage: (id <SoapDelegate>) handler topicRequest: (TopicRequest*) topicRequest;
	- (SoapRequest*) GetTopicByMessage: (id) target action: (SEL) action topicRequest: (TopicRequest*) topicRequest;

	/* Returns ChangeResponse*. ????????? ? ?????? ? ??????? ????????? ????????????? */
	- (SoapRequest*) GetNewData: (id <SoapDelegate>) handler changeRequest: (ChangeRequest*) changeRequest;
	- (SoapRequest*) GetNewData: (id) target action: (SEL) action changeRequest: (ChangeRequest*) changeRequest;

	/* Returns ForumResponse*. ?????? ??????? ? ????? ??????? */
	- (SoapRequest*) GetForumList: (id <SoapDelegate>) handler forumRequest: (ForumRequest*) forumRequest;
	- (SoapRequest*) GetForumList: (id) target action: (SEL) action forumRequest: (ForumRequest*) forumRequest;

	/* Returns UserResponse*. ????????? ????? ????????????? ? ??????? ????????? ????????????? */
	- (SoapRequest*) GetNewUsers: (id <SoapDelegate>) handler userRequest: (UserRequest*) userRequest;
	- (SoapRequest*) GetNewUsers: (id) target action: (SEL) action userRequest: (UserRequest*) userRequest;

	/* Returns UserResponse*. ????????? ????????????? ?? ?????? ?? ??????????????? */
	- (SoapRequest*) GetUserByIds: (id <SoapDelegate>) handler request: (UserByIdsRequest*) request;
	- (SoapRequest*) GetUserByIds: (id) target action: (SEL) action request: (UserByIdsRequest*) request;

	/* Returns id. ?????????? ????????? ? ?????? */
	- (SoapRequest*) PostChange: (id <SoapDelegate>) handler postRequest: (PostRequest*) postRequest;
	- (SoapRequest*) PostChange: (id) target action: (SEL) action postRequest: (PostRequest*) postRequest;

	/* Returns PostResponse*. ????????????? ?????????? ????????? ? ?????? */
	- (SoapRequest*) PostChangeCommit: (id <SoapDelegate>) handler;
	- (SoapRequest*) PostChangeCommit: (id) target action: (SEL) action;

	/* Returns id. ???????? ?????????? */
	- (SoapRequest*) Check: (id <SoapDelegate>) handler;
	- (SoapRequest*) Check: (id) target action: (SEL) action;

		
	+ (JanusAT*) service;
	+ (JanusAT*) serviceWithUsername: (NSString*) username andPassword: (NSString*) password;
@end
	