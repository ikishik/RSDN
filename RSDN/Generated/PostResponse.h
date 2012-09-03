/*
	PostResponse.h
	The interface definition of properties and methods for the PostResponse object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class ArrayOfInt;
@class ArrayOfPostExceptionInfo;
@class ArrayOfInt;
@class ArrayOfRatingExceptionInfo;
@class ArrayOfInt;
@class ArrayOfModerateExceptionInfo;

@interface PostResponse : SoapObject
{
	NSMutableArray* _commitedIds;
	NSMutableArray* _exceptions;
	NSMutableArray* _commitedRatingIds;
	NSMutableArray* _ratingExceptions;
	NSMutableArray* _commitedModerateIds;
	NSMutableArray* _moderateExceptions;
	
}
		
	@property (retain, nonatomic) NSMutableArray* commitedIds;
	@property (retain, nonatomic) NSMutableArray* exceptions;
	@property (retain, nonatomic) NSMutableArray* commitedRatingIds;
	@property (retain, nonatomic) NSMutableArray* ratingExceptions;
	@property (retain, nonatomic) NSMutableArray* commitedModerateIds;
	@property (retain, nonatomic) NSMutableArray* moderateExceptions;

	+ (PostResponse*) newWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
