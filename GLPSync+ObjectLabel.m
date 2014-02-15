#import "GLPSync+ObjectLabel.h"


@implementation GLPSync (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_SYNC_OBJECT_APPLE, (GLuint)sync);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_SYNC_OBJECT_APPLE, (GLuint)sync, objectLabel);
}
#endif

@end
