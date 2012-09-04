/*
	PostRequest.h
	The interface definition of properties and methods for the PostRequest object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class ArrayOfPostMessageInfo;
@class ArrayOfPostRatingInfo;
@class ArrayOfPostModerateInfo;

@interface PostRequest : SoapObject
{
	NSString* _userName;
	NSString* _password;
	NSMutableArray* _writedMessages;
	NSMutableArray* _rates;
	NSMutableArray* _moderates;
	
}
		
	@property (retain, nonatomic) NSString* userName;
	@property (retain, nonatomic) NSString* password;
	@property (retain, nonatomic) NSMutableArray* writedMessages;
	@property (retain, nonatomic) NSMutableArray* rates;
	@property (retain, nonatomic) NSMutableArray* moderates;

	+ (PostRequest*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end