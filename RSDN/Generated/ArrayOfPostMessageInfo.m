/*
	ArrayOfPostMessageInfo.h
	The implementation of properties and methods for the ArrayOfPostMessageInfo array.
	Generated by SudzC.com
*/
#import "ArrayOfPostMessageInfo.h"

#import "PostMessageInfo.h"
@implementation ArrayOfPostMessageInfo

	+ (id) newWithNode: (CXMLNode*) node
	{
		return [[ArrayOfPostMessageInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				PostMessageInfo* value = [[PostMessageInfo newWithNode: child] object];
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
			[s appendString: [item serialize: @"PostMessageInfo"]];
		}
		return s;
	}
@end
