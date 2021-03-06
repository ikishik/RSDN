/*
	ArrayOfJanusForumGroupInfo.h
	The implementation of properties and methods for the ArrayOfJanusForumGroupInfo array.
	Generated by SudzC.com
*/
#import "ArrayOfJanusForumGroupInfo.h"

#import "JanusForumGroupInfo.h"
@implementation ArrayOfJanusForumGroupInfo

	+ (id) newWithNode: (CXMLNode*) node
	{
		return [[ArrayOfJanusForumGroupInfo alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				JanusForumGroupInfo* value = [[JanusForumGroupInfo newWithNode: child] object];
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
			[s appendString: [item serialize: @"JanusForumGroupInfo"]];
		}
		return s;
	}
@end
