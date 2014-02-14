#import "GLPSync+ObjectLabel.h"

#import "GLPObjectLabel.h"


@implementation GLPSync (ObjectLabel)

- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_SYNC_OBJECT_APPLE, (GLuint)sync);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_SYNC_OBJECT_APPLE, (GLuint)sync, objectLabel);
}

@end
