/*
	PostExceptionInfo.h
	The interface definition of properties and methods for the PostExceptionInfo object.
	Generated by SudzC.com
*/

#import "Soap.h"
	

@interface PostExceptionInfo : SoapObject
{
	NSString* _exception;
	int _localMessageId;
	NSString* _info;
	
}
		
	@property (retain, nonatomic) NSString* exception;
	@property int localMessageId;
	@property (retain, nonatomic) NSString* info;

	+ (PostExceptionInfo*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
