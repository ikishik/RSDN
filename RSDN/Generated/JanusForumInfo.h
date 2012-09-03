/*
	JanusForumInfo.h
	The interface definition of properties and methods for the JanusForumInfo object.
	Generated by SudzC.com
*/

#import "Soap.h"
	

@interface JanusForumInfo : SoapObject
{
	int _forumId;
	int _forumGroupId;
	NSString* _shortForumName;
	NSString* _forumName;
	int _rated;
	int _inTop;
	int _rateLimit;
	
}
		
	@property int forumId;
	@property int forumGroupId;
	@property (retain, nonatomic) NSString* shortForumName;
	@property (retain, nonatomic) NSString* forumName;
	@property int rated;
	@property int inTop;
	@property int rateLimit;

	+ (JanusForumInfo*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
