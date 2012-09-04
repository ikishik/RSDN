/*
	PostRatingInfo.h
	The interface definition of properties and methods for the PostRatingInfo object.
	Generated by SudzC.com
*/

#import "Soap.h"
	

@interface PostRatingInfo : SoapObject
{
	int _localRatingId;
	int _messageId;
	int _rate;
	
}
		
	@property int localRatingId;
	@property int messageId;
	@property int rate;

	+ (PostRatingInfo*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end