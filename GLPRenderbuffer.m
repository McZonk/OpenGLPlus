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
		if(renderbuffer != 0)
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

- (void)bind
{
	glBindRenderbuffer(target, renderbuffer);
}

- (void)setPixelformat:(GLPPixelformat)pixelformat width:(GLuint)width height:(GLuint)height
{
	[self bind];
	
	GLuint internalFormat = glpPixelformatGetInternalFormat(pixelformat);
	
	glRenderbufferStorage(target, internalFormat, width, height);
}

@synthesize GLTarget = target;
@synthesize GLRenderbuffer = renderbuffer;

@end
