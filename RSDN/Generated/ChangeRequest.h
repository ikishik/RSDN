/*
	ChangeRequest.h
	The interface definition of properties and methods for the ChangeRequest object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class ArrayOfRequestForumInfo;
@class ArrayOfInt;
@class ArrayOfInt;

@interface ChangeRequest : SoapObject
{
	NSString* _userName;
	NSString* _password;
	NSMutableArray* _subscribedForums;
	NSData* _ratingRowVersion;
	NSData* _messageRowVersion;
	NSData* _moderateRowVersion;
	NSMutableArray* _breakMsgIds;
	NSMutableArray* _breakTopicIds;
	int _maxOutput;
	
}
		
	@property (retain, nonatomic) NSString* userName;
	@property (retain, nonatomic) NSString* password;
	@property (retain, nonatomic) NSMutableArray* subscribedForums;
	@property (retain, nonatomic) NSData* ratingRowVersion;
	@property (retain, nonatomic) NSData* messageRowVersion;
	@property (retain, nonatomic) NSData* moderateRowVersion;
	@property (retain, nonatomic) NSMutableArray* breakMsgIds;
	@property (retain, nonatomic) NSMutableArray* breakTopicIds;
	@property int maxOutput;

	+ (ChangeRequest*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
