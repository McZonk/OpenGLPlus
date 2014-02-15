#import "GLPTexture+ObjectLabel.h"

#import "GLPObjectLabel.h"


@implementation GLPTexture (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_TEXTURE, texture);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_TEXTURE, texture, objectLabel);
}
#endif

@end
