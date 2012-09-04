/*
	PostResponse.h
	The implementation of properties and methods for the PostResponse object.
	Generated by SudzC.com
*/
#import "PostResponse.h"

#import "ArrayOfInt.h"
#import "ArrayOfPostExceptionInfo.h"
#import "ArrayOfInt.h"
#import "ArrayOfRatingExceptionInfo.h"
#import "ArrayOfInt.h"
#import "ArrayOfModerateExceptionInfo.h"
@implementation PostResponse
	@synthesize commitedIds = _commitedIds;
	@synthesize exceptions = _exceptions;
	@synthesize commitedRatingIds = _commitedRatingIds;
	@synthesize ratingExceptions = _ratingExceptions;
	@synthesize commitedModerateIds = _commitedModerateIds;
	@synthesize moderateExceptions = _moderateExceptions;

	- (id) init
	{
		if(self = [super init])
		{
			self.commitedIds = [[NSMutableArray alloc] init];
			self.exceptions = [[NSMutableArray alloc] init];
			self.commitedRatingIds = [[NSMutableArray alloc] init];
			self.ratingExceptions = [[NSMutableArray alloc] init];
			self.commitedModerateIds = [[NSMutableArray alloc] init];
			self.moderateExceptions = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (PostResponse*) newWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (PostResponse*)[[PostResponse alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.commitedIds = [[ArrayOfInt newWithNode: [Soap getNode: node withName: @"commitedIds"]] object];
			self.exceptions = [[ArrayOfPostExceptionInfo newWithNode: [Soap getNode: node withName: @"exceptions"]] object];
			self.commitedRatingIds = [[ArrayOfInt newWithNode: [Soap getNode: node withName: @"commitedRatingIds"]] object];
			self.ratingExceptions = [[ArrayOfRatingExceptionInfo newWithNode: [Soap getNode: node withName: @"ratingExceptions"]] object];
			self.commitedModerateIds = [[ArrayOfInt newWithNode: [Soap getNode: node withName: @"commitedModerateIds"]] object];
			self.moderateExceptions = [[ArrayOfModerateExceptionInfo newWithNode: [Soap getNode: node withName: @"moderateExceptions"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"PostResponse"];
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
		if (self.commitedIds != nil && self.commitedIds.count > 0) {
			[s appendFormat: @"<commitedIds>%@</commitedIds>", [ArrayOfInt serialize: self.commitedIds]];
		} else {
			[s appendString: @"<commitedIds/>"];
		}
		if (self.exceptions != nil && self.exceptions.count > 0) {
			[s appendFormat: @"<exceptions>%@</exceptions>", [ArrayOfPostExceptionInfo serialize: self.exceptions]];
		} else {
			[s appendString: @"<exceptions/>"];
		}
		if (self.commitedRatingIds != nil && self.commitedRatingIds.count > 0) {
			[s appendFormat: @"<commitedRatingIds>%@</commitedRatingIds>", [ArrayOfInt serialize: self.commitedRatingIds]];
		} else {
			[s appendString: @"<commitedRatingIds/>"];
		}
		if (self.ratingExceptions != nil && self.ratingExceptions.count > 0) {
			[s appendFormat: @"<ratingExceptions>%@</ratingExceptions>", [ArrayOfRatingExceptionInfo serialize: self.ratingExceptions]];
		} else {
			[s appendString: @"<ratingExceptions/>"];
		}
		if (self.commitedModerateIds != nil && self.commitedModerateIds.count > 0) {
			[s appendFormat: @"<commitedModerateIds>%@</commitedModerateIds>", [ArrayOfInt serialize: self.commitedModerateIds]];
		} else {
			[s appendString: @"<commitedModerateIds/>"];
		}
		if (self.moderateExceptions != nil && self.moderateExceptions.count > 0) {
			[s appendFormat: @"<moderateExceptions>%@</moderateExceptions>", [ArrayOfModerateExceptionInfo serialize: self.moderateExceptions]];
		} else {
			[s appendString: @"<moderateExceptions/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[PostResponse class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end