#import "GLPBuffer+ObjectLabel.h"

#import "GLPObjectLabel.h"


@implementation GLPBuffer (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_BUFFER_OBJECT_EXT, buffer);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_BUFFER_OBJECT_EXT, buffer, objectLabel);
}
#endif

@end
