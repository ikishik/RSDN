/*
	ViolationResponse.h
	The interface definition of properties and methods for the ViolationResponse object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class ArrayOfJanusViolationInfo;

@interface ViolationResponse : SoapObject
{
	NSMutableArray* _Violations;
	
}
		
	@property (retain, nonatomic) NSMutableArray* Violations;

	+ (ViolationResponse*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
