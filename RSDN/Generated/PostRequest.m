/*
	PostRequest.h
	The implementation of properties and methods for the PostRequest object.
	Generated by SudzC.com
*/
#import "PostRequest.h"

#import "ArrayOfPostMessageInfo.h"
#import "ArrayOfPostRatingInfo.h"
#import "ArrayOfPostModerateInfo.h"
@implementation PostRequest
	@synthesize userName = _userName;
	@synthesize password = _password;
	@synthesize writedMessages = _writedMessages;
	@synthesize rates = _rates;
	@synthesize moderates = _moderates;

	- (id) init
	{
		if(self = [super init])
		{
			self.userName = nil;
			self.password = nil;
			self.writedMessages = [[NSMutableArray alloc] init];
			self.rates = [[NSMutableArray alloc] init];
			self.moderates = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (PostRequest*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (PostRequest*)[[PostRequest alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.userName = [Soap getNodeValue: node withName: @"userName"];
			self.password = [Soap getNodeValue: node withName: @"password"];
			self.writedMessages = [[ArrayOfPostMessageInfo newWithNode: [Soap getNode: node withName: @"writedMessages"]] object];
			self.rates = [[ArrayOfPostRatingInfo newWithNode: [Soap getNode: node withName: @"rates"]] object];
			self.moderates = [[ArrayOfPostModerateInfo newWithNode: [Soap getNode: node withName: @"moderates"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"PostRequest"];
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
		if (self.writedMessages != nil && self.writedMessages.count > 0) {
			[s appendFormat: @"<writedMessages>%@</writedMessages>", [ArrayOfPostMessageInfo serialize: self.writedMessages]];
		} else {
			[s appendString: @"<writedMessages/>"];
		}
		if (self.rates != nil && self.rates.count > 0) {
			[s appendFormat: @"<rates>%@</rates>", [ArrayOfPostRatingInfo serialize: self.rates]];
		} else {
			[s appendString: @"<rates/>"];
		}
		if (self.moderates != nil && self.moderates.count > 0) {
			[s appendFormat: @"<moderates>%@</moderates>", [ArrayOfPostModerateInfo serialize: self.moderates]];
		} else {
			[s appendString: @"<moderates/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[PostRequest class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
