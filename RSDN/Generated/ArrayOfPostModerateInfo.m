/*
	ArrayOfPostModerateInfo.h
	The implementation of properties and methods for the ArrayOfPostModerateInfo array.
	Generated by SudzC.com
*/
#import "ArrayOfPostModerateInfo.h"

#import "PostModerateInfo.h"
@implementation ArrayOfPostModerateInfo

	+ (id) newWithNode: (CXMLNode*) node
	{
		return [[ArrayOfPostModerateInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				PostModerateInfo* value = [[PostModerateInfo newWithNode: child] object];
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
			[s appendString: [item serialize: @"PostModerateInfo"]];
		}
		return s;
	}
@end