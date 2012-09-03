/*
	JanusMessageInfo.h
	The interface definition of properties and methods for the JanusMessageInfo object.
	Generated by SudzC.com
*/

#import "Soap.h"
	

@interface JanusMessageInfo : SoapObject
{
	int _messageId;
	int _topicId;
	int _parentId;
	int _userId;
	int _forumId;
	NSString* _subject;
	NSString* _messageName;
	NSString* _userNick;
	NSString* _message;
	int _articleId;
	NSDate* _messageDate;
	NSDate* _updateDate;
	NSString* _userRole;
	NSString* _userTitle;
	int _userTitleColor;
	NSDate* _lastModerated;
	BOOL _closed;
	
}
		
	@property int messageId;
	@property int topicId;
	@property int parentId;
	@property int userId;
	@property int forumId;
	@property (retain, nonatomic) NSString* subject;
	@property (retain, nonatomic) NSString* messageName;
	@property (retain, nonatomic) NSString* userNick;
	@property (retain, nonatomic) NSString* message;
	@property int articleId;
	@property (retain, nonatomic) NSDate* messageDate;
	@property (retain, nonatomic) NSDate* updateDate;
	@property (retain, nonatomic) NSString* userRole;
	@property (retain, nonatomic) NSString* userTitle;
	@property int userTitleColor;
	@property (retain, nonatomic) NSDate* lastModerated;
	@property BOOL closed;

	+ (JanusMessageInfo*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
