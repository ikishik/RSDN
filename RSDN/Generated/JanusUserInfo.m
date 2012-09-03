/*
	JanusUserInfo.h
	The implementation of properties and methods for the JanusUserInfo object.
	Generated by SudzC.com
*/
#import "JanusUserInfo.h"

@implementation JanusUserInfo
	@synthesize userId = _userId;
	@synthesize userName = _userName;
	@synthesize userNick = _userNick;
	@synthesize realName = _realName;
	@synthesize publicEmail = _publicEmail;
	@synthesize homePage = _homePage;
	@synthesize specialization = _specialization;
	@synthesize whereFrom = _whereFrom;
	@synthesize origin = _origin;
	@synthesize userClass = _userClass;

	- (id) init
	{
		if(self = [super init])
		{
			self.userName = nil;
			self.userNick = nil;
			self.realName = nil;
			self.publicEmail = nil;
			self.homePage = nil;
			self.specialization = nil;
			self.whereFrom = nil;
			self.origin = nil;

		}
		return self;
	}

	+ (JanusUserInfo*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (JanusUserInfo*)[[JanusUserInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.userId = [[Soap getNodeValue: node withName: @"userId"] intValue];
			self.userName = [Soap getNodeValue: node withName: @"userName"];
			self.userNick = [Soap getNodeValue: node withName: @"userNick"];
			self.realName = [Soap getNodeValue: node withName: @"realName"];
			self.publicEmail = [Soap getNodeValue: node withName: @"publicEmail"];
			self.homePage = [Soap getNodeValue: node withName: @"homePage"];
			self.specialization = [Soap getNodeValue: node withName: @"specialization"];
			self.whereFrom = [Soap getNodeValue: node withName: @"whereFrom"];
			self.origin = [Soap getNodeValue: node withName: @"origin"];
			self.userClass = [[Soap getNodeValue: node withName: @"userClass"] intValue];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"JanusUserInfo"];
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
		[s appendFormat: @"<userId>%@</userId>", [NSString stringWithFormat: @"%i", self.userId]];
		if (self.userName != nil) [s appendFormat: @"<userName>%@</userName>", [[self.userName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.userNick != nil) [s appendFormat: @"<userNick>%@</userNick>", [[self.userNick stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.realName != nil) [s appendFormat: @"<realName>%@</realName>", [[self.realName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.publicEmail != nil) [s appendFormat: @"<publicEmail>%@</publicEmail>", [[self.publicEmail stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.homePage != nil) [s appendFormat: @"<homePage>%@</homePage>", [[self.homePage stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.specialization != nil) [s appendFormat: @"<specialization>%@</specialization>", [[self.specialization stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.whereFrom != nil) [s appendFormat: @"<whereFrom>%@</whereFrom>", [[self.whereFrom stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.origin != nil) [s appendFormat: @"<origin>%@</origin>", [[self.origin stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<userClass>%@</userClass>", [NSString stringWithFormat: @"%i", self.userClass]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[JanusUserInfo class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
