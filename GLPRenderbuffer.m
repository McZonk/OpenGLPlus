#import "GLPRenderbuffer.h"

@implementation GLPRenderbuffer

+ (instancetype)renderbuffer
{
	return [[self alloc] init];
}

- (id)init
{
	self = [super init];
	if(self != nil)
	{
		target = GL_RENDERBUFFER;
		
		glGenRenderbuffers(1, &renderbuffer);
		if(renderbuffer == 0)
		{
			return nil;
		}
	}
	return self;
}

- (void)dealloc
{
	glDeleteRenderbuffers(1, &renderbuffer);
}

- (void)bindRenderbuffer
{
	glBindRenderbuffer(target, renderbuffer);
}

- (void)unbindRenderbuffer
{
	glBindRenderbuffer(target, 0);
}

- (void)setPixelformat:(GLPPixelformat)pixelformat width:(GLuint)width height:(GLuint)height
{
	[self bindRenderbuffer];
	
	GLuint internalFormat = glpPixelformatGetInternalFormat(pixelformat);
	
	glRenderbufferStorage(target, internalFormat, width, height);
}

- (GLint)getWidth
{
	GLint value;
	glGetRenderbufferParameteriv(target, GL_RENDERBUFFER_WIDTH, &value);
	return value;
}

- (GLint)getHeight
{
	GLint value;
	glGetRenderbufferParameteriv(target, GL_RENDERBUFFER_HEIGHT, &value);
	return value;
}


@synthesize GLTarget = target;
@synthesize GLRenderbuffer = renderbuffer;

@end
