/*
	ArrayOfModerateExceptionInfo.h
	The implementation of properties and methods for the ArrayOfModerateExceptionInfo array.
	Generated by SudzC.com
*/
#import "ArrayOfModerateExceptionInfo.h"

#import "ModerateExceptionInfo.h"
@implementation ArrayOfModerateExceptionInfo

	+ (id) newWithNode: (CXMLNode*) node
	{
		return [[ArrayOfModerateExceptionInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				ModerateExceptionInfo* value = [[ModerateExceptionInfo newWithNode: child] object];
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
			[s appendString: [item serialize: @"ModerateExceptionInfo"]];
		}
		return s;
	}
@end
