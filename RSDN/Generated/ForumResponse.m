/*
	ForumResponse.h
	The implementation of properties and methods for the ForumResponse object.
	Generated by SudzC.com
*/
#import "ForumResponse.h"

#import "ArrayOfJanusForumInfo.h"
#import "ArrayOfJanusForumGroupInfo.h"
@implementation ForumResponse
	@synthesize forumList = _forumList;
	@synthesize groupList = _groupList;
	@synthesize forumsRowVersion = _forumsRowVersion;

	- (id) init
	{
		if(self = [super init])
		{
			self.forumList = [[NSMutableArray alloc] init];
			self.groupList = [[NSMutableArray alloc] init];
			self.forumsRowVersion = nil;

		}
		return self;
	}

	+ (ForumResponse*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (ForumResponse*)[[ForumResponse alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.forumList = [[ArrayOfJanusForumInfo newWithNode: [Soap getNode: node withName: @"forumList"]] object];
			self.groupList = [[ArrayOfJanusForumGroupInfo newWithNode: [Soap getNode: node withName: @"groupList"]] object];
			self.forumsRowVersion = [Soap dataFromString: [Soap getNodeValue: node withName: @"forumsRowVersion"]];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"ForumResponse"];
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
		if (self.forumList != nil && self.forumList.count > 0) {
			[s appendFormat: @"<forumList>%@</forumList>", [ArrayOfJanusForumInfo serialize: self.forumList]];
		} else {
			[s appendString: @"<forumList/>"];
		}
		if (self.groupList != nil && self.groupList.count > 0) {
			[s appendFormat: @"<groupList>%@</groupList>", [ArrayOfJanusForumGroupInfo serialize: self.groupList]];
		} else {
			[s appendString: @"<groupList/>"];
		}
		if (self.forumsRowVersion != nil) [s appendFormat: @"<forumsRowVersion>%@</forumsRowVersion>", [Soap getBase64String: self.forumsRowVersion]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[ForumResponse class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
