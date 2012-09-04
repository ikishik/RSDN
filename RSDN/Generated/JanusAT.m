/*
	JanusAT.m
	The implementation classes and methods for the JanusAT web service.
	Generated by SudzC.com
*/

#import "JanusAT.h"
				
#import "Soap.h"
	
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

/* Implementation of the service */
				
@implementation JanusAT

	- (id) init
	{
		if(self = [super init])
		{
			self.serviceUrl = @"http://www.rsdn.ru/ws/janusAT.asmx";
			self.namespace = @"http://rsdn.ru/Janus/";
			self.headers = nil;
			self.logging = NO;
		}
		return self;
	}
	
	- (id) initWithUsername: (NSString*) username andPassword: (NSString*) password {
		if(self = [super initWithUsername:username andPassword:password]) {
		}
		return self;
	}
	
	+ (JanusAT*) service {
		return [JanusAT serviceWithUsername:nil andPassword:nil];
	}
	
	+ (JanusAT*) serviceWithUsername: (NSString*) username andPassword: (NSString*) password {
		return [[JanusAT alloc] initWithUsername:username andPassword:password];
	}

		
	/* Returns ViolationResponse*. ?????????? ????? ????????? ? ?????????? */
	- (SoapRequest*) GetNewViolations: (id <SoapDelegate>) handler request: (ViolationRequest*) request
	{
		return [self GetNewViolations: handler action: nil request: request];
	}

	- (SoapRequest*) GetNewViolations: (id) _target action: (SEL) _action request: (ViolationRequest*) request
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: request forName: @"request"]];
		NSString* _envelope = [Soap createEnvelope: @"GetNewViolations" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/GetNewViolations" postData: _envelope deserializeTo: [ViolationResponse alloc]];
		[_request send];
		return _request;
	}

	/* Returns TopicResponse*. ??????????? ??????? ?? ID ????????? */
	- (SoapRequest*) GetTopicByMessage: (id <SoapDelegate>) handler topicRequest: (TopicRequest*) topicRequest
	{
		return [self GetTopicByMessage: handler action: nil topicRequest: topicRequest];
	}

	- (SoapRequest*) GetTopicByMessage: (id) _target action: (SEL) _action topicRequest: (TopicRequest*) topicRequest
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: topicRequest forName: @"topicRequest"]];
		NSString* _envelope = [Soap createEnvelope: @"GetTopicByMessage" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/GetTopicByMessage" postData: _envelope deserializeTo: [TopicResponse alloc]];
		[_request send];
		return _request;
	}

	/* Returns ChangeResponse*. ????????? ? ?????? ? ??????? ????????? ????????????? */
	- (SoapRequest*) GetNewData: (id <SoapDelegate>) handler changeRequest: (ChangeRequest*) changeRequest
	{
		return [self GetNewData: handler action: nil changeRequest: changeRequest];
	}

	- (SoapRequest*) GetNewData: (id) _target action: (SEL) _action changeRequest: (ChangeRequest*) changeRequest
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: changeRequest forName: @"changeRequest"]];
		NSString* _envelope = [Soap createEnvelope: @"GetNewData" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/GetNewData" postData: _envelope deserializeTo: [ChangeResponse alloc]];
		[_request send];
		return _request;
	}

	/* Returns ForumResponse*. ?????? ??????? ? ????? ??????? */
	- (SoapRequest*) GetForumList: (id <SoapDelegate>) handler forumRequest: (ForumRequest*) forumRequest
	{
		return [self GetForumList: handler action: nil forumRequest: forumRequest];
	}

	- (SoapRequest*) GetForumList: (id) _target action: (SEL) _action forumRequest: (ForumRequest*) forumRequest
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: forumRequest forName: @"forumRequest"]];
		NSString* _envelope = [Soap createEnvelope: @"GetForumList" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/GetForumList" postData: _envelope deserializeTo: [ForumResponse alloc]];
		[_request send];
		return _request;
	}

	/* Returns UserResponse*. ????????? ????? ????????????? ? ??????? ????????? ????????????? */
	- (SoapRequest*) GetNewUsers: (id <SoapDelegate>) handler userRequest: (UserRequest*) userRequest
	{
		return [self GetNewUsers: handler action: nil userRequest: userRequest];
	}

	- (SoapRequest*) GetNewUsers: (id) _target action: (SEL) _action userRequest: (UserRequest*) userRequest
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: userRequest forName: @"userRequest"]];
		NSString* _envelope = [Soap createEnvelope: @"GetNewUsers" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/GetNewUsers" postData: _envelope deserializeTo: [UserResponse alloc]];
		[_request send];
		return _request;
	}

	/* Returns UserResponse*. ????????? ????????????? ?? ?????? ?? ??????????????? */
	- (SoapRequest*) GetUserByIds: (id <SoapDelegate>) handler request: (UserByIdsRequest*) request
	{
		return [self GetUserByIds: handler action: nil request: request];
	}

	- (SoapRequest*) GetUserByIds: (id) _target action: (SEL) _action request: (UserByIdsRequest*) request
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: request forName: @"request"]];
		NSString* _envelope = [Soap createEnvelope: @"GetUserByIds" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/GetUserByIds" postData: _envelope deserializeTo: [UserResponse alloc]];
		[_request send];
		return _request;
	}

	/* Returns id. ?????????? ????????? ? ?????? */
	- (SoapRequest*) PostChange: (id <SoapDelegate>) handler postRequest: (PostRequest*) postRequest
	{
		return [self PostChange: handler action: nil postRequest: postRequest];
	}

	- (SoapRequest*) PostChange: (id) _target action: (SEL) _action postRequest: (PostRequest*) postRequest
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		[_params addObject: [[SoapParameter alloc] initWithValue: postRequest forName: @"postRequest"]];
		NSString* _envelope = [Soap createEnvelope: @"PostChange" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/PostChange" postData: _envelope deserializeTo: nil];
		[_request send];
		return _request;
	}

	/* Returns PostResponse*. ????????????? ?????????? ????????? ? ?????? */
	- (SoapRequest*) PostChangeCommit: (id <SoapDelegate>) handler
	{
		return [self PostChangeCommit: handler action: nil];
	}

	- (SoapRequest*) PostChangeCommit: (id) _target action: (SEL) _action
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		NSString* _envelope = [Soap createEnvelope: @"PostChangeCommit" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/PostChangeCommit" postData: _envelope deserializeTo: [PostResponse alloc]];
		[_request send];
		return _request;
	}

	/* Returns id. ???????? ?????????? */
	- (SoapRequest*) Check: (id <SoapDelegate>) handler
	{
		return [self Check: handler action: nil];
	}

	- (SoapRequest*) Check: (id) _target action: (SEL) _action
		{
		NSMutableArray* _params = [NSMutableArray array];
		
		NSString* _envelope = [Soap createEnvelope: @"Check" forNamespace: self.namespace withParameters: _params withHeaders: self.headers];
		SoapRequest* _request = [SoapRequest create: _target action: _action service: self soapAction: @"http://rsdn.ru/Janus/Check" postData: _envelope deserializeTo: nil];
		[_request send];
		return _request;
	}


@end
	