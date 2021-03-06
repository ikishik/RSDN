/*
	ArrayOfInt.h
	The implementation of properties and methods for the ArrayOfInt array.
	Generated by SudzC.com
*/
#import "ArrayOfInt.h"

@implementation ArrayOfInt

	+ (id) newWithNode: (CXMLNode*) node
	{
		return [[ArrayOfInt alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				NSNumber* value = [NSNumber numberWithInt: [[child stringValue] intValue]];
				[self addObject: value];
			}
		}
		return self;
	}
	
	+ (NSMutableString*) serialize: (NSArray*) array
	{
		NSMutableString* s = [NSMutableString string];
		for(id item in array) {
			//[s appendString: [NSString stringWithFormat: @"%@", item]];
            [s appendString: [NSString stringWithFormat: @"<int>%@</int>", item]];
		}
		return s;
	}
@end
