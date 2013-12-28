#import "GLPProgram+ObjectLabel.h"

#import "GLPObjectLabel.h"


@implementation GLPProgram (ObjectLabel)

- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_PROGRAM_OBJECT_EXT, program);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_PROGRAM_OBJECT_EXT, program, objectLabel);
}

@end
