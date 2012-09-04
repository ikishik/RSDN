/*
	ViolationRequest.h
	The interface definition of properties and methods for the ViolationRequest object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class ArrayOfRequestForumInfo;

@interface ViolationRequest : SoapObject
{
	NSString* _UserName;
	NSString* _Password;
	NSMutableArray* _SubscribedForums;
	NSData* _LastRowVersion;
	
}
		
	@property (retain, nonatomic) NSString* UserName;
	@property (retain, nonatomic) NSString* Password;
	@property (retain, nonatomic) NSMutableArray* SubscribedForums;
	@property (retain, nonatomic) NSData* LastRowVersion;

	+ (ViolationRequest*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end