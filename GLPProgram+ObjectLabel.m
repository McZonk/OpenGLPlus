#import "GLPProgram+ObjectLabel.h"


@implementation GLPProgram (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_PROGRAM_OBJECT_EXT, program);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_PROGRAM_OBJECT_EXT, program, objectLabel);
}
#endif

@end
