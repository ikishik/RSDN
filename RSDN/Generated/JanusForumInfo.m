/*
	JanusForumInfo.h
	The implementation of properties and methods for the JanusForumInfo object.
	Generated by SudzC.com
*/
#import "JanusForumInfo.h"

@implementation JanusForumInfo
	@synthesize forumId = _forumId;
	@synthesize forumGroupId = _forumGroupId;
	@synthesize shortForumName = _shortForumName;
	@synthesize forumName = _forumName;
	@synthesize rated = _rated;
	@synthesize inTop = _inTop;
	@synthesize rateLimit = _rateLimit;

	- (id) init
	{
		if(self = [super init])
		{
			self.shortForumName = nil;
			self.forumName = nil;

		}
		return self;
	}

	+ (JanusForumInfo*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (JanusForumInfo*)[[JanusForumInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.forumId = [[Soap getNodeValue: node withName: @"forumId"] intValue];
			self.forumGroupId = [[Soap getNodeValue: node withName: @"forumGroupId"] intValue];
			self.shortForumName = [Soap getNodeValue: node withName: @"shortForumName"];
			self.forumName = [Soap getNodeValue: node withName: @"forumName"];
			self.rated = [[Soap getNodeValue: node withName: @"rated"] intValue];
			self.inTop = [[Soap getNodeValue: node withName: @"inTop"] intValue];
			self.rateLimit = [[Soap getNodeValue: node withName: @"rateLimit"] intValue];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"JanusForumInfo"];
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
		[s appendFormat: @"<forumId>%@</forumId>", [NSString stringWithFormat: @"%i", self.forumId]];
		[s appendFormat: @"<forumGroupId>%@</forumGroupId>", [NSString stringWithFormat: @"%i", self.forumGroupId]];
		if (self.shortForumName != nil) [s appendFormat: @"<shortForumName>%@</shortForumName>", [[self.shortForumName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.forumName != nil) [s appendFormat: @"<forumName>%@</forumName>", [[self.forumName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<rated>%@</rated>", [NSString stringWithFormat: @"%i", self.rated]];
		[s appendFormat: @"<inTop>%@</inTop>", [NSString stringWithFormat: @"%i", self.inTop]];
		[s appendFormat: @"<rateLimit>%@</rateLimit>", [NSString stringWithFormat: @"%i", self.rateLimit]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[JanusForumInfo class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
