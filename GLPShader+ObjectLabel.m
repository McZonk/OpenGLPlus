#import "GLPShader+ObjectLabel.h"


@implementation GLPShader (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_SHADER_OBJECT_EXT, shader);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_SHADER_OBJECT_EXT, shader, objectLabel);
}
#endif

@end
