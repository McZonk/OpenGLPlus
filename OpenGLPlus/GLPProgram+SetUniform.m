#import "GLPProgram+SetUniform.h"

#import "GLPUniformBase.h"


@implementation GLPProgram (SetUniform)

- (void)setUniform:(GLint)location floatValue:(GLfloat)x
{
	glpUniform1f(program, location, x);
}

- (void)setUniform:(GLint)location floatValue:(GLfloat)x :(GLfloat)y
{
	glpUniform2f(program, location, x, y);
}

- (void)setUniform:(GLint)location floatValue:(GLfloat)x :(GLfloat)y :(GLfloat)z
{
	glpUniform3f(program, location, x, y, z);
}

- (void)setUniform:(GLint)location floatValue:(GLfloat)x :(GLfloat)y :(GLfloat)z :(GLfloat)w
{
	glpUniform4f(program, location, x, y, z, w);
}

- (void)setUniform:(GLint)location float1Values:(const GLfloat *)values count:(GLsizei)count
{
	glpUniform1fv(program, location, count, values);
}

- (void)setUniform:(GLint)location float2Values:(const GLfloat *)values count:(GLsizei)count
{
	glpUniform2fv(program, location, count, values);
}

- (void)setUniform:(GLint)location float3Values:(const GLfloat *)values count:(GLsizei)count
{
	glpUniform3fv(program, location, count, values);
}

- (void)setUniform:(GLint)location float4Values:(const GLfloat *)values count:(GLsizei)count
{
	glpUniform4fv(program, location, count, values);
}

- (void)setUniform:(GLint)location intValue:(GLint)x
{
	glpUniform1i(program, location, x);
}

- (void)setUniform:(GLint)location intValue:(GLint)x :(GLint)y
{
	glpUniform2i(program, location, x, y);
}

- (void)setUniform:(GLint)location intValue:(GLint)x :(GLint)y :(GLint)z
{
	glpUniform3i(program, location, x, y, z);
}

- (void)setUniform:(GLint)location intValue:(GLint)x :(GLint)y :(GLint)z :(GLint)w
{
	glpUniform4i(program, location, x, y, z, w);
}

- (void)setUniform:(GLint)location int1Values:(const GLint *)values count:(GLsizei)count
{
	glpUniform1iv(program, location, count, values);
}

- (void)setUniform:(GLint)location int2Values:(const GLint *)values count:(GLsizei)count
{
	glpUniform2iv(program, location, count, values);
}

- (void)setUniform:(GLint)location int3Values:(const GLint *)values count:(GLsizei)count
{
	glpUniform3iv(program, location, count, values);
}

- (void)setUniform:(GLint)location int4Values:(const GLint *)values count:(GLsizei)count
{
	glpUniform4iv(program, location, count, values);
}

- (void)setUniform:(GLint)location matrix2Value:(const GLfloat *)value
{
	glpUniformMatrix2fv(program, location, 1, GL_FALSE, value);
}

- (void)setUniform:(GLint)location matrix3Value:(const GLfloat *)value
{
	glpUniformMatrix3fv(program, location, 1, GL_FALSE, value);
}

- (void)setUniform:(GLint)location matrix4Value:(const GLfloat *)value
{
	glpUniformMatrix4fv(program, location, 1, GL_FALSE, value);
}

- (void)setUniform:(GLint)location matrix2Values:(const GLfloat *)value count:(GLsizei)count
{
	glpUniformMatrix2fv(program, location, count, GL_FALSE, value);
}

- (void)setUniform:(GLint)location matrix3Values:(const GLfloat *)value count:(GLsizei)count
{
	glpUniformMatrix3fv(program, location, count, GL_FALSE, value);
}

- (void)setUniform:(GLint)location matrix4Values:(const GLfloat *)value count:(GLsizei)count
{
	glpUniformMatrix4fv(program, location, count, GL_FALSE, value);
}

- (void)setUniformNamed:(NSString*)name floatValue:(GLfloat)x
{
	glpUniformNamed1f(program, name.UTF8String, x);
}

- (void)setUniformNamed:(NSString*)name floatValue:(GLfloat)x :(GLfloat)y
{
	glpUniformNamed2f(program, name.UTF8String, x, y);
}

- (void)setUniformNamed:(NSString*)name floatValue:(GLfloat)x :(GLfloat)y :(GLfloat)z
{
	glpUniformNamed3f(program, name.UTF8String, x, y, z);
}

- (void)setUniformNamed:(NSString*)name floatValue:(GLfloat)x :(GLfloat)y :(GLfloat)z :(GLfloat)w
{
	glpUniformNamed4f(program, name.UTF8String, x, y, z, w);
}

- (void)setUniformNamed:(NSString*)name float1Values:(const GLfloat *)values count:(GLsizei)count
{
	glpUniformNamed1fv(program, name.UTF8String, count, values);
}

- (void)setUniformNamed:(NSString*)name float2Values:(const GLfloat *)values count:(GLsizei)count
{
	glpUniformNamed2fv(program, name.UTF8String, count, values);
}

- (void)setUniformNamed:(NSString*)name float3Values:(const GLfloat *)values count:(GLsizei)count
{
	glpUniformNamed3fv(program, name.UTF8String, count, values);
}

- (void)setUniformNamed:(NSString*)name float4Values:(const GLfloat *)values count:(GLsizei)count
{
	glpUniformNamed4fv(program, name.UTF8String, count, values);
}

- (void)setUniformNamed:(NSString*)name intValue:(GLint)x
{
	glpUniformNamed1i(program, name.UTF8String, x);
}

- (void)setUniformNamed:(NSString*)name intValue:(GLint)x :(GLint)y
{
	glpUniformNamed2i(program, name.UTF8String, x, y);
}

- (void)setUniformNamed:(NSString*)name intValue:(GLint)x :(GLint)y :(GLint)z
{
	glpUniformNamed3i(program, name.UTF8String, x, y, z);
}

- (void)setUniformNamed:(NSString*)name intValue:(GLint)x :(GLint)y :(GLint)z :(GLint)w
{
	glpUniformNamed4i(program, name.UTF8String, x, y, z, w);
}

- (void)setUniformNamed:(NSString*)name int1Values:(const GLint *)values count:(GLsizei)count
{
	glpUniformNamed1iv(program, name.UTF8String, count, values);
}

- (void)setUniformNamed:(NSString*)name int2Values:(const GLint *)values count:(GLsizei)count
{
	glpUniformNamed2iv(program, name.UTF8String, count, values);
}

- (void)setUniformNamed:(NSString*)name int3Values:(const GLint *)values count:(GLsizei)count
{
	glpUniformNamed3iv(program, name.UTF8String, count, values);
}

- (void)setUniformNamed:(NSString*)name int4Values:(const GLint *)values count:(GLsizei)count
{
	glpUniformNamed4iv(program, name.UTF8String, count, values);
}

- (void)setUniformNamed:(NSString*)name matrix2Value:(const GLfloat *)value
{
	glpUniformNamedMatrix2fv(program, name.UTF8String, 1, GL_FALSE, value);
}

- (void)setUniformNamed:(NSString*)name matrix3Value:(const GLfloat *)value
{
	glpUniformNamedMatrix3fv(program, name.UTF8String, 1, GL_FALSE, value);
}

- (void)setUniformNamed:(NSString*)name matrix4Value:(const GLfloat *)value
{
	glpUniformNamedMatrix4fv(program, name.UTF8String, 1, GL_FALSE, value);
}

- (void)setUniformNamed:(NSString*)name matrix2Values:(const GLfloat *)value count:(GLsizei)count
{
	glpUniformNamedMatrix2fv(program, name.UTF8String, count, GL_FALSE, value);
}

- (void)setUniformNamed:(NSString*)name matrix3Values:(const GLfloat *)value count:(GLsizei)count
{
	glpUniformNamedMatrix3fv(program, name.UTF8String, count, GL_FALSE, value);
}

- (void)setUniformNamed:(NSString*)name matrix4Values:(const GLfloat *)value count:(GLsizei)count
{
	glpUniformNamedMatrix4fv(program, name.UTF8String, count, GL_FALSE, value);
}

@end
