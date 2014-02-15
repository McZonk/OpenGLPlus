#import "GLPFramebuffer+ObjectLabel.h"


@implementation GLPFramebuffer (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_FRAMEBUFFER, framebuffer);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_FRAMEBUFFER, framebuffer, objectLabel);
}
#endif

@end
