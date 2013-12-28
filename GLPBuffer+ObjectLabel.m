#import "GLPBuffer+ObjectLabel.h"

#import "GLPObjectLabel.h"


@implementation GLPBuffer (ObjectLabel)

- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_BUFFER_OBJECT_EXT, buffer);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_BUFFER_OBJECT_EXT, buffer, objectLabel);
}

@end
