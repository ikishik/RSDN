/*
	ArrayOfPostRatingInfo.h
	The implementation of properties and methods for the ArrayOfPostRatingInfo array.
	Generated by SudzC.com
*/
#import "ArrayOfPostRatingInfo.h"

#import "PostRatingInfo.h"
@implementation ArrayOfPostRatingInfo

	+ (id) newWithNode: (CXMLNode*) node
	{
		return [[ArrayOfPostRatingInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				PostRatingInfo* value = [[PostRatingInfo newWithNode: child] object];
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
			[s appendString: [item serialize: @"PostRatingInfo"]];
		}
		return s;
	}
@end
