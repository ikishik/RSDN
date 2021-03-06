/*
	ChangeRequest.h
	The implementation of properties and methods for the ChangeRequest object.
	Generated by SudzC.com
*/
#import "ChangeRequest.h"

#import "ArrayOfRequestForumInfo.h"
#import "ArrayOfInt.h"
#import "ArrayOfInt.h"
@implementation ChangeRequest
	@synthesize userName = _userName;
	@synthesize password = _password;
	@synthesize subscribedForums = _subscribedForums;
	@synthesize ratingRowVersion = _ratingRowVersion;
	@synthesize messageRowVersion = _messageRowVersion;
	@synthesize moderateRowVersion = _moderateRowVersion;
	@synthesize breakMsgIds = _breakMsgIds;
	@synthesize breakTopicIds = _breakTopicIds;
	@synthesize maxOutput = _maxOutput;

	- (id) init
	{
		if(self = [super init])
		{
			self.userName = nil;
			self.password = nil;
			self.subscribedForums = [[NSMutableArray alloc] init];
			self.ratingRowVersion = nil;
			self.messageRowVersion = nil;
			self.moderateRowVersion = nil;
			self.breakMsgIds = [[NSMutableArray alloc] init];
			self.breakTopicIds = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (ChangeRequest*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (ChangeRequest*)[[ChangeRequest alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.userName = [Soap getNodeValue: node withName: @"userName"];
			self.password = [Soap getNodeValue: node withName: @"password"];
			self.subscribedForums = [[ArrayOfRequestForumInfo newWithNode: [Soap getNode: node withName: @"subscribedForums"]] object];
			self.ratingRowVersion = [Soap dataFromString: [Soap getNodeValue: node withName: @"ratingRowVersion"]];
			self.messageRowVersion = [Soap dataFromString: [Soap getNodeValue: node withName: @"messageRowVersion"]];
			self.moderateRowVersion = [Soap dataFromString: [Soap getNodeValue: node withName: @"moderateRowVersion"]];
			self.breakMsgIds = [[ArrayOfInt newWithNode: [Soap getNode: node withName: @"breakMsgIds"]] object];
			self.breakTopicIds = [[ArrayOfInt newWithNode: [Soap getNode: node withName: @"breakTopicIds"]] object];
			self.maxOutput = [[Soap getNodeValue: node withName: @"maxOutput"] intValue];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"ChangeRequest"];
	}
  
	- (NSMutableString*) serialize: (NSString*) nodeName
	{
		NSMutableString* s = [NSMutableString string];
		[s appendFormat: @"<%@", nodeName];
		[s appendString: [self serializeAttributes]];
		[s appendString: @">"];
		[s appendString: [self serializeElements]];
		[s appendFormat: @"</%@>", nodeName];
		return s;
	}
	
	- (NSMutableString*) serializeElements
	{
		NSMutableString* s = [super serializeElements];
		if (self.userName != nil) [s appendFormat: @"<userName>%@</userName>", [[self.userName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.password != nil) [s appendFormat: @"<password>%@</password>", [[self.password stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.subscribedForums != nil && self.subscribedForums.count > 0) {
			[s appendFormat: @"<subscribedForums>%@</subscribedForums>", [ArrayOfRequestForumInfo serialize: self.subscribedForums]];
		} else {
			[s appendString: @"<subscribedForums/>"];
		}
		if (self.ratingRowVersion != nil) [s appendFormat: @"<ratingRowVersion>%@</ratingRowVersion>", [Soap getBase64String: self.ratingRowVersion]];
		if (self.messageRowVersion != nil) [s appendFormat: @"<messageRowVersion>%@</messageRowVersion>", [Soap getBase64String: self.messageRowVersion]];
		if (self.moderateRowVersion != nil) [s appendFormat: @"<moderateRowVersion>%@</moderateRowVersion>", [Soap getBase64String: self.moderateRowVersion]];
		if (self.breakMsgIds != nil && self.breakMsgIds.count > 0) {
			[s appendFormat: @"<breakMsgIds>%@</breakMsgIds>", [ArrayOfInt serialize: self.breakMsgIds]];
		} else {
			[s appendString: @"<breakMsgIds/>"];
		}
		if (self.breakTopicIds != nil && self.breakTopicIds.count > 0) {
			[s appendFormat: @"<breakTopicIds>%@</breakTopicIds>", [ArrayOfInt serialize: self.breakTopicIds]];
		} else {
			[s appendString: @"<breakTopicIds/>"];
		}
		[s appendFormat: @"<maxOutput>%@</maxOutput>", [NSString stringWithFormat: @"%i", self.maxOutput]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[ChangeRequest class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
