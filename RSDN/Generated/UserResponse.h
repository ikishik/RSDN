/*
	UserResponse.h
	The interface definition of properties and methods for the UserResponse object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class ArrayOfJanusUserInfo;

@interface UserResponse : SoapObject
{
	NSData* _lastRowVersion;
	NSMutableArray* _users;
	
}
		
	@property (retain, nonatomic) NSData* lastRowVersion;
	@property (retain, nonatomic) NSMutableArray* users;

	+ (UserResponse*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
