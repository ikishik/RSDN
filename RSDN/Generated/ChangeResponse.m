/*
	ChangeResponse.h
	The implementation of properties and methods for the ChangeResponse object.
	Generated by SudzC.com
*/
#import "ChangeResponse.h"

#import "ArrayOfJanusMessageInfo.h"
#import "ArrayOfJanusRatingInfo.h"
#import "ArrayOfJanusModerateInfo.h"
@implementation ChangeResponse
	@synthesize nMessages = _newMessages;
	@synthesize nRating = _newRating;
	@synthesize nModerate = _newModerate;
	@synthesize lastRatingRowVersion = _lastRatingRowVersion;
	@synthesize lastForumRowVersion = _lastForumRowVersion;
	@synthesize lastModerateRowVersion = _lastModerateRowVersion;
	@synthesize userId = _userId;

	- (id) init
	{
		if(self = [super init])
		{
			self.nMessages = [[NSMutableArray alloc] init];
			self.nRating = [[NSMutableArray alloc] init];
			self.nModerate = [[NSMutableArray alloc] init];
			self.lastRatingRowVersion = nil;
			self.lastForumRowVersion = nil;
			self.lastModerateRowVersion = nil;

		}
		return self;
	}

	+ (ChangeResponse*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (ChangeResponse*)[[ChangeResponse alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.nMessages = [[ArrayOfJanusMessageInfo newWithNode: [Soap getNode: node withName: @"newMessages"]] object];
			self.nRating = [[ArrayOfJanusRatingInfo newWithNode: [Soap getNode: node withName: @"newRating"]] object];
			self.nModerate = [[ArrayOfJanusModerateInfo newWithNode: [Soap getNode: node withName: @"newModerate"]] object];
			self.lastRatingRowVersion = [Soap dataFromString: [Soap getNodeValue: node withName: @"lastRatingRowVersion"]];
			self.lastForumRowVersion = [Soap dataFromString: [Soap getNodeValue: node withName: @"lastForumRowVersion"]];
			self.lastModerateRowVersion = [Soap dataFromString: [Soap getNodeValue: node withName: @"lastModerateRowVersion"]];
			self.userId = [[Soap getNodeValue: node withName: @"userId"] intValue];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"ChangeResponse"];
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
		if (self.nMessages != nil && self.nMessages.count > 0) {
			[s appendFormat: @"<newMessages>%@</newMessages>", [ArrayOfJanusMessageInfo serialize: self.nMessages]];
		} else {
			[s appendString: @"<newMessages/>"];
		}
		if (self.nRating != nil && self.nRating.count > 0) {
			[s appendFormat: @"<newRating>%@</newRating>", [ArrayOfJanusRatingInfo serialize: self.nRating]];
		} else {
			[s appendString: @"<newRating/>"];
		}
		if (self.nModerate != nil && self.nModerate.count > 0) {
			[s appendFormat: @"<newModerate>%@</newModerate>", [ArrayOfJanusModerateInfo serialize: self.nModerate]];
		} else {
			[s appendString: @"<newModerate/>"];
		}
		if (self.lastRatingRowVersion != nil) [s appendFormat: @"<lastRatingRowVersion>%@</lastRatingRowVersion>", [Soap getBase64String: self.lastRatingRowVersion]];
		if (self.lastForumRowVersion != nil) [s appendFormat: @"<lastForumRowVersion>%@</lastForumRowVersion>", [Soap getBase64String: self.lastForumRowVersion]];
		if (self.lastModerateRowVersion != nil) [s appendFormat: @"<lastModerateRowVersion>%@</lastModerateRowVersion>", [Soap getBase64String: self.lastModerateRowVersion]];
		[s appendFormat: @"<userId>%@</userId>", [NSString stringWithFormat: @"%i", self.userId]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[ChangeResponse class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end