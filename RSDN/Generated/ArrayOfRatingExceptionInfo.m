/*
	ArrayOfRatingExceptionInfo.h
	The implementation of properties and methods for the ArrayOfRatingExceptionInfo array.
	Generated by SudzC.com
*/
#import "ArrayOfRatingExceptionInfo.h"

#import "RatingExceptionInfo.h"
@implementation ArrayOfRatingExceptionInfo

	+ (id) newWithNode: (CXMLNode*) node
	{
		return [[ArrayOfRatingExceptionInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				RatingExceptionInfo* value = [[RatingExceptionInfo newWithNode: child] object];
				if(value != nil) {
					[self addObject: value];
				}
			}
		}
		return self;
	}
	
	+ (NSMutableString*) serialize: (NSArray*) array
	{
		NSMutableString* s = [NSMutableString string];
		for(id item in array) {
			[s appendString: [item serialize: @"RatingExceptionInfo"]];
		}
		return s;
	}
@end