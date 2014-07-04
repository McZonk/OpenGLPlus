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
		glGenVertexArrays(1, &vertexArray);
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
		glDeleteVertexArrays(1, &vertexArray);
	}
}

@synthesize GLVertexArray = vertexArray;

- (void)bind
{
	glBindVertexArray(vertexArray);
}

- (void)unbind
{
	glBindVertexArray(0);
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p object:%u>", self.class, self, vertexArray];
}

@end
