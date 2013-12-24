#import "GLPVertexArray.h"


@implementation GLPVertexArray

+ (instancetype)vertexArray
{
	return [[self alloc] init];
}

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
		glGenVertexArraysOES(1, &vertexArray);
		if(vertexArray == 0)
		{
			return nil;
		}
	}
	return self;
}

- (void)dealloc
{
	if(vertexArray != 0)
	{
		glDeleteVertexArraysOES(1, &vertexArray);
	}
}

@synthesize GLVertexArray = vertexArray;

- (void)bind
{
	glBindVertexArrayOES(vertexArray);
}

- (void)unbind
{
	glBindVertexArrayOES(0);
}

- (NSString *)description
{
	NSString *objectLabel = self.objectLabel;
	if(objectLabel != nil)
	{
		return [NSString stringWithFormat:@"<%@: %p object:%u label:%@>", self.class, self, vertexArray, objectLabel];
	}
	else
	{
		return [NSString stringWithFormat:@"<%@: %p object:%u>", self.class, self, vertexArray];
	}
}

#pragma mark - GLPObjectLabel

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_VERTEX_ARRAY_OBJECT_EXT, vertexArray);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_VERTEX_ARRAY_OBJECT_EXT, vertexArray, objectLabel);
}
#endif /* GL_EXT_debug_label */

@end
