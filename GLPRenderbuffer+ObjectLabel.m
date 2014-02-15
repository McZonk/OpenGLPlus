#import "GLPRenderbuffer+ObjectLabel.h"


@implementation GLPRenderbuffer (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_RENDERBUFFER, renderbuffer);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_RENDERBUFFER, renderbuffer, objectLabel);
}
#endif

@end
