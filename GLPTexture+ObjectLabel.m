#import "GLPTexture+ObjectLabel.h"

#import "GLPObjectLabel.h"


@implementation GLPTexture (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
#if defined(GL_ES_VERSION_3_0) && (GL_ES_VERSION_3_0 > 0)
	GLenum type = GL_SAMPLER;
#else
	GLenum type = target == GL_TEXTURE_CUBE_MAP ? GL_SAMPLER_CUBE : GL_SAMPLER_2D;
#endif
	return GLPGetObjectLabelString(type, texture);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
#if defined(GL_ES_VERSION_3_0) && (GL_ES_VERSION_3_0 > 0)
	GLenum type = GL_SAMPLER;
#else
	GLenum type = target == GL_TEXTURE_CUBE_MAP ? GL_SAMPLER_CUBE : GL_SAMPLER_2D;
#endif
	GLPSetObjectLabelString(type, texture, objectLabel);
}
#endif

@end
