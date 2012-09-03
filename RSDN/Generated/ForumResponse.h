/*
	ForumResponse.h
	The interface definition of properties and methods for the ForumResponse object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class ArrayOfJanusForumInfo;
@class ArrayOfJanusForumGroupInfo;

@interface ForumResponse : SoapObject
{
	NSMutableArray* _forumList;
	NSMutableArray* _groupList;
	NSData* _forumsRowVersion;
	
}
		
	@property (retain, nonatomic) NSMutableArray* forumList;
	@property (retain, nonatomic) NSMutableArray* groupList;
	@property (retain, nonatomic) NSData* forumsRowVersion;

	+ (ForumResponse*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
