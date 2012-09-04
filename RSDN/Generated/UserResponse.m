/*
	UserResponse.h
	The implementation of properties and methods for the UserResponse object.
	Generated by SudzC.com
*/
#import "UserResponse.h"

#import "ArrayOfJanusUserInfo.h"
@implementation UserResponse
	@synthesize lastRowVersion = _lastRowVersion;
	@synthesize users = _users;

	- (id) init
	{
		if(self = [super init])
		{
			self.lastRowVersion = nil;
			self.users = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (UserResponse*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (UserResponse*)[[UserResponse alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.lastRowVersion = [Soap dataFromString: [Soap getNodeValue: node withName: @"lastRowVersion"]];
			self.users = [[ArrayOfJanusUserInfo newWithNode: [Soap getNode: node withName: @"users"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"UserResponse"];
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
		if (self.lastRowVersion != nil) [s appendFormat: @"<lastRowVersion>%@</lastRowVersion>", [Soap getBase64String: self.lastRowVersion]];
		if (self.users != nil && self.users.count > 0) {
			[s appendFormat: @"<users>%@</users>", [ArrayOfJanusUserInfo serialize: self.users]];
		} else {
			[s appendString: @"<users/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[UserResponse class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end