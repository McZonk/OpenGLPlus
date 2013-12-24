#import "GLPProgram.h"


@interface GLPProgram (SetUniform)

- (void)setUniform:(GLint)location floatValue:(GLfloat)x;
- (void)setUniform:(GLint)location floatValue:(GLfloat)x :(GLfloat)y;
- (void)setUniform:(GLint)location floatValue:(GLfloat)x :(GLfloat)y :(GLfloat)z;
- (void)setUniform:(GLint)location floatValue:(GLfloat)x :(GLfloat)y :(GLfloat)z :(GLfloat)w;

- (void)setUniform:(GLint)location float1Values:(const GLfloat *)values count:(GLsizei)count;
- (void)setUniform:(GLint)location float2Values:(const GLfloat *)values count:(GLsizei)count;
- (void)setUniform:(GLint)location float3Values:(const GLfloat *)values count:(GLsizei)count;
- (void)setUniform:(GLint)location float4Values:(const GLfloat *)values count:(GLsizei)count;

- (void)setUniform:(GLint)location intValue:(GLint)x;
- (void)setUniform:(GLint)location intValue:(GLint)x :(GLint)y;
- (void)setUniform:(GLint)location intValue:(GLint)x :(GLint)y :(GLint)z;
- (void)setUniform:(GLint)location intValue:(GLint)x :(GLint)y :(GLint)z :(GLint)w;

- (void)setUniform:(GLint)location int1Values:(const GLint *)values count:(GLsizei)count;
- (void)setUniform:(GLint)location int2Values:(const GLint *)values count:(GLsizei)count;
- (void)setUniform:(GLint)location int3Values:(const GLint *)values count:(GLsizei)count;
- (void)setUniform:(GLint)location int4Values:(const GLint *)values count:(GLsizei)count;

- (void)setUniform:(GLint)location matrix2Value:(const GLfloat *)value;
- (void)setUniform:(GLint)location matrix3Value:(const GLfloat *)value;
- (void)setUniform:(GLint)location matrix4Value:(const GLfloat *)value;

- (void)setUniform:(GLint)location matrix2Values:(const GLfloat *)value count:(GLsizei)count;
- (void)setUniform:(GLint)location matrix3Values:(const GLfloat *)value count:(GLsizei)count;
- (void)setUniform:(GLint)location matrix4Values:(const GLfloat *)value count:(GLsizei)count;

- (void)setUniformNamed:(NSString*)name floatValue:(GLfloat)x;
- (void)setUniformNamed:(NSString*)name floatValue:(GLfloat)x :(GLfloat)y;
- (void)setUniformNamed:(NSString*)name floatValue:(GLfloat)x :(GLfloat)y :(GLfloat)z;
- (void)setUniformNamed:(NSString*)name floatValue:(GLfloat)x :(GLfloat)y :(GLfloat)z :(GLfloat)w;

- (void)setUniformNamed:(NSString*)name float1Values:(const GLfloat *)values count:(GLsizei)count;
- (void)setUniformNamed:(NSString*)name float2Values:(const GLfloat *)values count:(GLsizei)count;
- (void)setUniformNamed:(NSString*)name float3Values:(const GLfloat *)values count:(GLsizei)count;
- (void)setUniformNamed:(NSString*)name float4Values:(const GLfloat *)values count:(GLsizei)count;

- (void)setUniformNamed:(NSString*)name intValue:(GLint)x;
- (void)setUniformNamed:(NSString*)name intValue:(GLint)x :(GLint)y;
- (void)setUniformNamed:(NSString*)name intValue:(GLint)x :(GLint)y :(GLint)z;
- (void)setUniformNamed:(NSString*)name intValue:(GLint)x :(GLint)y :(GLint)z :(GLint)w;

- (void)setUniformNamed:(NSString*)name int1Values:(const GLint *)values count:(GLsizei)count;
- (void)setUniformNamed:(NSString*)name int2Values:(const GLint *)values count:(GLsizei)count;
- (void)setUniformNamed:(NSString*)name int3Values:(const GLint *)values count:(GLsizei)count;
- (void)setUniformNamed:(NSString*)name int4Values:(const GLint *)values count:(GLsizei)count;

- (void)setUniformNamed:(NSString*)name matrix2Value:(const GLfloat *)value;
- (void)setUniformNamed:(NSString*)name matrix3Value:(const GLfloat *)value;
- (void)setUniformNamed:(NSString*)name matrix4Value:(const GLfloat *)value;

- (void)setUniformNamed:(NSString*)name matrix2Values:(const GLfloat *)value count:(GLsizei)count;
- (void)setUniformNamed:(NSString*)name matrix3Values:(const GLfloat *)value count:(GLsizei)count;
- (void)setUniformNamed:(NSString*)name matrix4Values:(const GLfloat *)value count:(GLsizei)count;

@end
