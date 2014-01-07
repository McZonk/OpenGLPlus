#import "GLPProgram+XML.h"

#import "GLPProgram+SetUniform.h"
#import "GLPShader.h"
#import "NSError+GLPError.h"


@interface GLPProgramXMLParser : NSXMLParser <NSXMLParserDelegate>

@property (nonatomic, assign) Class programClass;

@property (nonatomic, strong) NSDictionary* attributes;
@property (nonatomic, strong) NSMutableString* text;
@property (nonatomic, assign) NSUInteger textLineNumber;

@property (nonatomic, strong) GLPProgram* program;
@property (nonatomic, strong) NSError* error;

- (GLPProgram *)loadProgramWithClass:(Class)class error:(NSError **)error;

@end


@implementation GLPProgram (XML)

+ (instancetype)linkedProgramWithXMLFile:(NSString *)path error:(NSError **)error
{
	if(path == nil)
	{
		return nil;
	}
	
	return [self linkedProgramWithXMLURL:[NSURL fileURLWithPath:path] error:error];
}

+ (instancetype)linkedProgramWithXMLURL:(NSURL *)URL error:(NSError** )error
{
	if(URL == nil)
	{
		return nil;
	}
	
	GLPProgramXMLParser *parser = [[GLPProgramXMLParser alloc] initWithContentsOfURL:URL];
	return [parser loadProgramWithClass:self error:error];
}

+ (instancetype)linkedProgramWithXMLResource:(NSString *)resource bundle:(NSBundle *)bundle error:(NSError **)error
{
	if(bundle == nil) {
		bundle = NSBundle.mainBundle;
	}
	
	NSString* file = [bundle pathForResource:resource ofType:nil];
	if(!file) {
		file = [bundle pathForResource:resource ofType:@"xml"];
	}
	
	return [self linkedProgramWithXMLFile:file error:error];
}

@end


@implementation GLPProgramXMLParser

- (GLPProgram *)loadProgramWithClass:(Class)class error:(NSError **)outError {
	self.programClass = class;
	
	self.delegate = self;
	
	BOOL success = NO;
	@autoreleasepool
	{
		success = [self parse];
	}
	
	NSError *error = self.error;
	if(error != nil)
	{
		if(outError != nil)
		{
			*outError = error;
		}
		else
		{
			NSLog(@"XML error: %@", error);
		}
	}
	return success ? self.program : nil;
}

#pragma mark - NSXMLParserDelegate

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
	if(!self.program.linked)
	{
		NSError *error = nil;
		if(![self.program link:&error])
		{
			self.error = error;
			return;
		}
	}
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributes
{
	self.attributes = attributes;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	NSDictionary *attributes = self.attributes;
	
	if([elementName isEqualToString:@"shader"]) {
		GLenum type = 0;
		
		NSString* attributeType = attributes[@"type"];
		if([attributeType isEqualToString:@"vertex"])
		{
			type = GL_VERTEX_SHADER;
		}
		else if([attributeType isEqualToString:@"fragment"])
		{
			type = GL_FRAGMENT_SHADER;
		}
		else
		{
			self.error = [NSError errorWithDomain:GLPErrorDomain code:GLPErrorInvalidShaderTypeError userInfo:nil];
			[parser abortParsing];
			return;
		}
		
		GLPShader *shader = [GLPShader shaderWithType:type];
		
		NSString *attributeSource = attributes[@"src"];
		if(attributeSource.length > 0)
		{
			NSString *path = [NSBundle.mainBundle pathForResource:attributeSource ofType:nil];
			
			NSError *error = nil;
			if(![shader compileContentsOfFile:path error:&error])
			{
				self.error = error;
				[self abortParsing];
				return;
			}
		}
		else
		{
			NSString *source = [NSString stringWithFormat:@"#pragma line %ld\n%@", (unsigned long)self.textLineNumber, self.text];
			
			NSError *error = nil;
			if(![shader compileSource:source error:&error])
			{
				self.error = error;
				[self abortParsing];
				return;
			}
		}
		
		if(self.program == nil)
		{
			self.program = [self.programClass program];
		}
		
		[self.program attachShader:shader];
	}
	else if([elementName isEqualToString:@"attribute"])
	{
		NSString* name = self.attributes[@"name"];
		NSString* location = self.attributes[@"location"];
		
		if([name isKindOfClass:NSString.class] && [location isKindOfClass:NSString.class])
		{
			//NSLog(@"attribute name:%@ loction:%@", name, location);
			[self.program bindAttribute:name toLocation:location.intValue];
		}
	}
	else if([elementName isEqualToString:@"uniform"])
	{
		if(!self.program.linked)
		{
			NSError *error = nil;
			if(![self.program link:&error])
			{
				self.error = error;
				[self abortParsing];
				return;
			}
		}
		
		NSString *name = attributes[@"name"];
		NSString *type = attributes[@"type"];
		NSString *value = attributes[@"value"];
		
		NSScanner *valueScanner = [NSScanner scannerWithString:value];
		
		if([type hasPrefix:@"int"])
		{
			int index = 0;
			int values[4] = { 0, 0, 0, 0 };
			
			while(index < 4 && [valueScanner scanInt:values + index])
			{
				++index;
			}
			
			if([type isEqualToString:@"int"])
			{
				[self.program setUniformNamed:name intValue:values[0]];
			}
			else if([type isEqualToString:@"int2"])
			{
				[self.program setUniformNamed:name intValue:values[0] :values[1]];
			}
			else if([type isEqualToString:@"int3"])
			{
				[self.program setUniformNamed:name intValue:values[0] :values[1] :values[2]];
			}
			else
			{
				[self.program setUniformNamed:name intValue:values[0] :values[1] :values[2] :values[3]];
			}
		}
		else if([type isEqualToString:@"float"] || [type hasPrefix:@"vec"])
		{
			int index = 0;
			float values[4] = { 0.0f, 0.0f, 0.0f, 0.0f };
			
			while(index < 4 && [valueScanner scanFloat:values + index])
			{
				++index;
			}
			
			if([type isEqualToString:@"float"])
			{
				[self.program setUniformNamed:name floatValue:values[0]];
			}
			else if([type isEqualToString:@"vec2"])
			{
				[self.program setUniformNamed:name floatValue:values[0] :values[1]];
			}
			else if([type isEqualToString:@"vec3"])
			{
				[self.program setUniformNamed:name floatValue:values[0] :values[1] :values[2]];
			}
			else
			{
				[self.program setUniformNamed:name floatValue:values[0] :values[1] :values[2] :values[3]];
			}
		}
		else if([type isEqualToString:@"mat2"])
		{
			int index = 0;
			float values[4] = {
				1.0f, 0.0f,
				0.0f, 1.0f,
			};
			
			if(![value isEqualToString:@"IDENTITY"])
			{
				while(index < 4 && [valueScanner scanFloat:values + index])
				{
					++index;
				}
			}
			
			[self.program setUniformNamed:name matrix2Value:values];
		}
		else if([type isEqualToString:@"mat3"])
		{
			int index = 0;
			float values[9] = {
				1.0f, 0.0f, 0.0f,
				0.0f, 1.0f, 0.0f,
				0.0f, 0.0f, 1.0f,
			};
			
			if(![value isEqualToString:@"IDENTITY"])
			{
				while(index < 9 && [valueScanner scanFloat:values + index])
				{
					++index;
				}
			}
			
			[self.program setUniformNamed:name matrix3Value:values];
		}
		else if([type isEqualToString:@"mat4"])
		{
			int index = 0;
			float values[16] = {
				1.0f, 0.0f, 0.0f, 0.0f,
				0.0f, 1.0f, 0.0f, 0.0f,
				0.0f, 0.0f, 1.0f, 0.0f,
				0.0f, 0.0f, 0.0f, 1.0f
			};
			
			if(![value isEqualToString:@"IDENTITY"])
			{
				while(index < 16 && [valueScanner scanFloat:values + index])
				{
					++index;
				}
			}
			
			[self.program setUniformNamed:name matrix4Value:values];
		}
		else
		{
			NSLog(@"invalid uniform: name:%@ type:%@ value:%@", name, type, value);
		}
	}
	
	// clean up
	self.attributes = nil;
	self.text = nil;
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
	if(self.text == nil)
	{
		self.text = [NSMutableString stringWithString:string];
		self.textLineNumber = self.lineNumber;
	}
	else
	{
		[self.text appendString:string];
	}
}

@end