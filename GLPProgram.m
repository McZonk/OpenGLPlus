#import "GLPProgram.h"

#import "GLPShader.h"
#import "GLPProgramBase.h"


@implementation GLPProgram

+ (instancetype)program
{
	return [[self alloc] init];
}

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
		program = glCreateProgram();
	}
	return self;
}

- (void)dealloc
{
	if(program != 0)
	{
		glDeleteProgram(program);
	}
}

@synthesize GLProgram = program;

- (void)attachShader:(GLPShader*)shader
{
	[self attachGLShader:shader.GLShader];
}

- (void)attachGLShader:(GLuint)shader
{
	glAttachShader(program, shader);
}

- (void)detachShader:(GLPShader*)shader
{
	[self detachGLShader:shader.GLShader];
}

- (void)detachGLShader:(GLuint)shader
{
	glDetachShader(program, shader);
}

- (BOOL)link:(NSError**)error
{
	BOOL linked = glpProgramLink(program);
	
	if(!linked)
	{
		NSString *infoLog = self.infoLog;
		
		if(error != nil)
		{
			NSDictionary *userInfo = @{
				GLPErrorInfoLogKey: infoLog,
				NSLocalizedDescriptionKey: infoLog,
			};
			*error = [NSError errorWithDomain:GLPErrorDomain code:GLPErrorProgramLinkerError userInfo:userInfo];
		}
		else
		{
			NSLog(@"%@ linker error: %@", self.class, infoLog);
		}
	}
	
	return linked;
}

- (BOOL)linked
{
	return glpProgramGetLinkStatus(program);
}

- (NSString*)infoLog
{
	char* infoLog = glpProgramCopyInfoLog(program);
	
	NSString* string = [[NSString alloc] initWithCString:infoLog encoding:NSUTF8StringEncoding];
	
	free(infoLog), infoLog = 0;
	
	return string;
}

- (GLint)attributeLocation:(NSString *)name
{
	return glGetAttribLocation(program, name.UTF8String);
}

- (GLint)uniformLocation:(NSString *)name
{
	return glGetUniformLocation(program, name.UTF8String);
}

- (void)bindAttribute:(NSString *)name toLocation:(GLint)location
{
	glBindAttribLocation(program, location, name.UTF8String);
}

- (void)bindAttributes:(NSDictionary *)attributes
{
	for(NSNumber* location in attributes)
	{
		NSString *attribute = attributes[location];
		
		[self bindAttribute:attribute toLocation:location.intValue];
	}
}

- (void)use
{
	glUseProgram(program);
}

- (NSString *)description
{
	NSMutableString* description = [NSMutableString string];
	
	[description appendFormat:@"<%@: %p", [self class], (void*)self];
	
#if 0
	// attributes
	{
		GLuint count = 0;
		glGetProgramiv(program, GL_ACTIVE_ATTRIBUTES, (GLint*)&count);
		
		if(count > 0) {
			[description appendFormat:@"\nattributes = {\n"];
			for(GLuint index = 0; index < count; ++index) {
				GLsizei nameLength = 0;
				GLint size = 0;
				GLenum type = 0;
				GLchar name[96];
				
				glGetActiveAttrib(program, index, sizeof(name), &nameLength, &size, &type, name);
				
				GLint location = glGetAttribLocation(program, name);
				
				[description appendFormat:@"	%d %s %d %s\n", location, name, size, glpTypeName(type)];
			}
			[description appendFormat:@"}"];
		}
	}
	
	// uniforms
	{
		GLuint count = 0;
		glGetProgramiv(program, GL_ACTIVE_UNIFORMS, (GLint*)&count);
		
		if(count > 0) {
			[description appendFormat:@"\nuniforms = {\n"];
			for(GLuint index = 0; index < count; ++index) {
				GLsizei nameLength = 0;
				GLint size = 0;
				GLenum type = 0;
				GLchar name[96];
				
				glGetActiveUniform(program, index, sizeof(name), &nameLength, &size, &type, name);
				
				GLint location = glGetUniformLocation(program, name);
				
				[description appendFormat:@"	%d %s %d %s", location, name, size, glpTypeName(type)];
				
				GLuint components = glpTypeComponents(type);
				
				if(components * size <= 16) {
					[description appendFormat:@" = "];
					
					GLboolean isFloat = glpTypeIsFloat(type);
					
					if(isFloat) {
						float values[16];
						glGetUniformfv(program, location, values);
						
						for(unsigned int s = 0; s < size; ++s) {
							[description appendFormat:@"{ "];
							
							for(unsigned int c = 0; c < components; ++c) {
								[description appendFormat:@"%.3f ", values[s * components + c]];
							}
							
							[description appendFormat:@"} "];
						}
					} else {
						int values[16];
						glGetUniformiv(program, location, values);
						
						for(unsigned int s = 0; s < size; ++s) {
							[description appendFormat:@"{ "];
							
							for(unsigned int c = 0; c < components; ++c) {
								[description appendFormat:@"%i ", values[s * components + c]];
							}
							
							[description appendFormat:@"} "];
						}
					}
				}
				
				[description appendFormat:@"\n"];
			}
			[description appendFormat:@"}\n"];
		}
	}
#endif
	
	[description appendFormat:@">"];
	
	return description;
}

@end
