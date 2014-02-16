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
	return [NSString stringWithFormat:@"<%@: %p object:%u>", self.class, self, vertexArray];
}

@end
