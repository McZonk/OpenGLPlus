#import "GLPProgram+DebugInformation.h"

#include "GLPBase.h"


@interface GLPProgramAttribute ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, assign, readwrite) GLint index;
@property (nonatomic, assign, readwrite) GLenum type;
@property (nonatomic, assign, readwrite) GLint count;
@property (nonatomic, assign, readwrite) GLint location;

@end

@implementation GLPProgramAttribute

- (NSString *)description
{
	return [NSString stringWithFormat:@"attribute idx:%2d loc:%2d %@ %d %s", self.index, self.location, self.name, self.count, glpTypeName(self.type)];
}

@end



@interface GLPProgramUniform ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, assign, readwrite) GLint index;
@property (nonatomic, assign, readwrite) GLenum type;
@property (nonatomic, assign, readwrite) GLint count;
@property (nonatomic, assign, readwrite) GLint location;

@end

@implementation GLPProgramUniform

- (NSString *)description
{
	return [NSString stringWithFormat:@"uniform idx:%2d loc:%2d %@ %d %s", self.index, self.location, self.name, self.count, glpTypeName(self.type)];
}

@end



@implementation GLPProgram (DebugInformation)

- (GLint)attributeCount
{
	GLint value;
	glGetProgramiv(self.GLProgram, GL_ACTIVE_ATTRIBUTES, &value);
	return value;
}

- (GLint)uniformCount
{
	GLint value;
	glGetProgramiv(self.GLProgram, GL_ACTIVE_UNIFORMS, &value);
	return value;
}

- (NSArray *)attributes
{
	GLint count = self.attributeCount;
	
	NSMutableArray *attributes = [[NSMutableArray alloc] initWithCapacity:count];
	
	for(GLint index = 0; index < count; ++index)
	{
		GLsizei nameLength = 0;
		GLint size = 0;
		GLenum type = 0;
		GLchar name[96];
		
		glGetActiveAttrib(program, index, sizeof(name), &nameLength, &size, &type, name);
		
		GLint location = glGetAttribLocation(program, name);
		
		GLPProgramAttribute *attribute = [[GLPProgramAttribute alloc] init];
		attribute.name = [[NSString alloc] initWithUTF8String:name];
		attribute.index = index;
		attribute.type = type;
		attribute.count = size;
		attribute.location = location;
		[attributes addObject:attribute];
	}
	
	return [[NSArray alloc] initWithArray:attributes];
	
}

- (NSArray *)uniforms
{
	GLint count = self.uniformCount;
	
	NSMutableArray *uniforms = [[NSMutableArray alloc] initWithCapacity:count];
	
	for(GLint index = 0; index < count; ++index)
	{
		GLsizei nameLength = 0;
		GLint size = 0;
		GLenum type = 0;
		GLchar name[96];
		
		glGetActiveUniform(program, index, sizeof(name), &nameLength, &size, &type, name);
		
		GLint location = glGetUniformLocation(program, name);
		
		GLPProgramUniform* uniform = [[GLPProgramUniform alloc] init];
		uniform.name = [[NSString alloc] initWithUTF8String:name];
		uniform.index = index;
		uniform.type = type;
		uniform.count = size;
		uniform.location = location;
		[uniforms addObject:uniform];
	}
	
	return [[NSArray alloc] initWithArray:uniforms];
}

@end