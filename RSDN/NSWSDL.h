/*
  NSWSDL.h
 
 Version: 1.827
 
 */

#if TARGET_OS_IPHONE
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

#if TARGET_OS_IPHONE

#define NSXMLDocumentValidate 1
#define NSXMLDocumentTidyXML 2




@interface NSXMLNode : NSObject {
	NSString* stringValue;
	NSString* nodeName;
	NSString* localName;
	NSString* name;
}

+(id) elementWithName: (NSString*)name;

@property (nonatomic, copy) NSString* stringValue;
@property (nonatomic, copy) NSString* nodeName;
@property (nonatomic, copy) NSString* localName;
@property (nonatomic, copy) NSString* name;


-(NSString*) encodedValue;

-(NSString*) prefix;

-(void) appendValue: (NSString*) value;

@end



@interface NSXMLElement : NSXMLNode {
	NSMutableArray* attributes;
	NSMutableArray* children;
	NSString* namespaceURI;
	//NSXMLElement* parent;
}
@property (readwrite, copy) NSString* namespaceURI;

+(NSXMLElement*) xmlElement;

//-(id) init;


-(NSArray*) elementsForName: (NSString*)name;
-(NSArray*) elementsForLocalName: (NSString*)name URI:(NSString*) URI;

-(NSArray*) children;

-(void) addChild:(NSXMLElement*) child;

-(NSXMLNode*) attributeForName: (NSString*) name;

-(NSString*) innerXML;

-(void) appendAttributes: (NSDictionary*) values;
-(void) setAttribute: (NSString*) name withValue:(NSString*) value;
//@property (nonatomic, retain) NSXMLElement* parent;

@end

@interface NSXMLDocument : NSObject<NSXMLParserDelegate>  {
	
	NSXMLElement* __weak rootElement;
	NSXMLElement* __weak current;
	NSMutableArray* __weak stack;
	NSMutableDictionary* __weak lastAttributes;
}

-(id) initWithXMLString: (NSString*) text options:(NSInteger)validationOption error:(NSError**)pError;
-(id) initWithData: (NSData*) data options:(NSInteger)validationOption error:(NSError**)pErrpr;

@property (weak, nonatomic) NSXMLElement* rootElement;
@property (weak, nonatomic) NSXMLElement* current;
@property (weak, nonatomic) NSMutableArray* stack;
@property (weak, nonatomic) NSMutableDictionary* lastAttributes;


-(NSData*) XMLData;

@end
#endif


@interface SoapRequest : NSObject
{
	NSXMLDocument* __weak document;
	NSXMLElement* __weak header;
	NSXMLElement* __weak method;
	NSString* methodName;
	NSString* soapAction;
	NSString* rawHttpRequest;
}

@property (weak, nonatomic) NSXMLDocument* document;
@property (weak, nonatomic) NSXMLElement* header;
@property (weak, nonatomic) NSXMLElement* method;
@property (nonatomic, copy) NSString* methodName;
@property (nonatomic, copy) NSString* soapAction;
@property (nonatomic, copy) NSString* rawHttpRequest;

+(SoapRequest*) soapRequest;

@end


@interface SoapResponse : NSObject
{

	NSXMLElement* __weak header;
	NSXMLElement* __weak body;
	NSXMLElement* __weak response;
	NSString* __weak faultCode;
	NSString* __weak faultString;
    NSString* __weak faultDetail;
	NSString* __weak rawHttpResponse;
}

@property (weak, nonatomic) NSXMLElement* header;
@property (weak, nonatomic) NSXMLElement* body;
@property (weak, nonatomic) NSXMLElement* response;
@property (weak, nonatomic) NSString* faultCode;
@property (weak, nonatomic) NSString* faultString;
@property (weak, nonatomic) NSString* faultDetail;
@property (weak, nonatomic) NSString* rawHttpResponse;

+(SoapResponse*) soapResponse;

@end



@interface SoapWebService : NSObject
{
	NSString* __url;
	NSString* baseUrl;
	id __unsafe_unretained delegate;
	NSMutableData* __weak data;
	SEL responseSelector;
	
	NSString* soapAction;
}

@property (nonatomic, copy) NSString* baseUrl;
@property (nonatomic, copy) NSString* __url;
@property (nonatomic, copy) NSString* soapAction;
@property (unsafe_unretained, nonatomic) id delegate;
@property (weak, nonatomic) NSMutableData* data;


-(SoapRequest*) buildSoapRequest: (NSString*) methodName withNS:(NSString*)nsUri withAction:(NSString*)action withHeader:(NSString*)header error:(NSError**) pError;
-(SoapResponse*) getSoapResponse: (SoapRequest*) doc error:(NSError**) pError;
//-(NSXMLElement*) getSoapRoot: (NSXMLElement*) docRoot;
//-(NSXMLElement*) getSoapRequest: (NSXMLDocument*) doc;
-(void) addParameter: (NSXMLElement*)root withName:(NSString*)name withValue:(NSString*) value;

-(NSString*) getServiceUrl;


-(void) postSoapRequest: (SoapRequest*) doc selector:(SEL)s;
-(void) soapResponseReceived: (SoapResponse*)response withSelector:(SEL) sel;
-(void) onError: (NSError*) error;

+(NSString*) globalBaseUrl;
+(void) setGlobalBaseUrl:(NSString*) gbUrl;

-(NSString*) soapEnvelopeNS;
-(NSString*) contentType;
-(BOOL) isSoapActionRequired;

@end

@interface Soap12WebService : SoapWebService
{
}
@end


@interface BaseWSObject : NSObject
{
	
}

-(void) fillXML:(NSXMLElement*) node;
-(NSXMLElement*) toXMLElement;

@end



@interface NSWSDLDateTime : NSObject{
}
@end



/*@interface NSArrayDataSource : NSObject{
 NSArray* internalArray;
 }
 -(id) initWithArray: (NSArray*) objects;
 -(int)numberOfRowsInTableView:(NSTableView *)aTableView;
 -(id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(int)rowIndex;
 -(void)tableView:(NSTableView *)aTableView setObjectValue:(id)anObject forTableColumn:(NSTableColumn *)aTableColumn row:(int)rowIndex;
 @end
 */

@interface NSWSDL : NSObject {
	
}

+(NSXMLElement*)getElementNS:(NSXMLElement*) root forNamespace:(NSString*) forNS forName:(NSString*) name;
+(NSXMLElement*)	getElement: (NSXMLElement*) root: (NSString*) name;
+(NSString*)	getAttributeString: (NSXMLElement*) root: (NSString*) name;

+(NSString*)		getString:	(NSXMLElement*) root: (NSString*) name :(BOOL) bAttribute;
+(NSNumber*)		getBool: (NSXMLElement*) root: (NSString*) name: (BOOL) bAttribute;
+(NSDecimalNumber*)	getNumber: (NSXMLElement*) root: (NSString*) name: (BOOL) bAttribute;
+(NSDate*)  getDate: (NSXMLElement*) root: (NSString*) name: (BOOL) bAttribute;

+(NSXMLDocument*) documentWithText: (NSString*)text orData:(NSData*) data  options:(NSInteger)validationOption error:(NSError**)pError;

+(void) setBusy:(BOOL)busy;

+(void) addChild: (NSXMLElement*) root withName:(NSString*) name withValue:(NSString*) value asAttribute:(BOOL)bAttribute;
+(void) addChildArray: (NSXMLElement*) root withName: (NSString*) name withType:(NSString*) type withArray:(NSArray*) array;
+(void) addChildArrayInline: (NSXMLElement*) root withName: (NSString*) name withType:(NSString*) type withArray:(NSArray*) array;
+(void) addChildNode: (NSXMLElement*) root withName:(NSString*) name withElement: (NSXMLElement*) e withObject:(BaseWSObject*) obj;
+(NSEnumerator*) getChildren:(NSXMLElement*)e forName:(NSString*) name;

+(NSString*) toDateString:(NSDate*) date;

@end
