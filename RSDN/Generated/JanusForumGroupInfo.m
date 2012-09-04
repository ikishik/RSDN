/*
	JanusForumGroupInfo.h
	The implementation of properties and methods for the JanusForumGroupInfo object.
	Generated by SudzC.com
*/
#import "JanusForumGroupInfo.h"

@implementation JanusForumGroupInfo
	@synthesize forumGroupId = _forumGroupId;
	@synthesize forumGroupName = _forumGroupName;
	@synthesize sortOrder = _sortOrder;

	- (id) init
	{
		if(self = [super init])
		{
			self.forumGroupName = nil;

		}
		return self;
	}

	+ (JanusForumGroupInfo*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (JanusForumGroupInfo*)[[JanusForumGroupInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.forumGroupId = [[Soap getNodeValue: node withName: @"forumGroupId"] intValue];
			self.forumGroupName = [Soap getNodeValue: node withName: @"forumGroupName"];
			self.sortOrder = [[Soap getNodeValue: node withName: @"sortOrder"] intValue];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"JanusForumGroupInfo"];
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
		[s appendFormat: @"<forumGroupId>%@</forumGroupId>", [NSString stringWithFormat: @"%i", self.forumGroupId]];
		if (self.forumGroupName != nil) [s appendFormat: @"<forumGroupName>%@</forumGroupName>", [[self.forumGroupName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<sortOrder>%@</sortOrder>", [NSString stringWithFormat: @"%i", self.sortOrder]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[JanusForumGroupInfo class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end