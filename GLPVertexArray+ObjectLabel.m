#import "GLPVertexArray+ObjectLabel.h"


@implementation GLPVertexArray (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_VERTEX_ARRAY_OBJECT_EXT, vertexArray);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_VERTEX_ARRAY_OBJECT_EXT, vertexArray, objectLabel);
}
#endif

@end
