/*
	PostMessageInfo.h
	The implementation of properties and methods for the PostMessageInfo object.
	Generated by SudzC.com
*/
#import "PostMessageInfo.h"

@implementation PostMessageInfo
	@synthesize localMessageId = _localMessageId;
	@synthesize parentId = _parentId;
	@synthesize forumId = _forumId;
	@synthesize subject = _subject;
	@synthesize message = _message;

	- (id) init
	{
		if(self = [super init])
		{
			self.subject = nil;
			self.message = nil;

		}
		return self;
	}

	+ (PostMessageInfo*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (PostMessageInfo*)[[PostMessageInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.localMessageId = [[Soap getNodeValue: node withName: @"localMessageId"] intValue];
			self.parentId = [[Soap getNodeValue: node withName: @"parentId"] intValue];
			self.forumId = [[Soap getNodeValue: node withName: @"forumId"] intValue];
			self.subject = [Soap getNodeValue: node withName: @"subject"];
			self.message = [Soap getNodeValue: node withName: @"message"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"PostMessageInfo"];
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
		[s appendFormat: @"<localMessageId>%@</localMessageId>", [NSString stringWithFormat: @"%i", self.localMessageId]];
		[s appendFormat: @"<parentId>%@</parentId>", [NSString stringWithFormat: @"%i", self.parentId]];
		[s appendFormat: @"<forumId>%@</forumId>", [NSString stringWithFormat: @"%i", self.forumId]];
		if (self.subject != nil) [s appendFormat: @"<subject>%@</subject>", [[self.subject stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.message != nil) [s appendFormat: @"<message>%@</message>", [[self.message stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[PostMessageInfo class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end