#import "GLPFramebuffer.h"

@implementation GLPFramebuffer

+ (instancetype)framebuffer
{
	return [[self alloc] init];
}

- (instancetype)init
{
	self = [super init];
	if(self != nil) {
		target = GL_FRAMEBUFFER;
		
		glGenFramebuffers(1, &framebuffer);
		if(framebuffer == 0)
		{
			return nil;
		}
	}
	return self;
}

- (void)dealloc
{
	glDeleteFramebuffers(1, &framebuffer);
}

- (void)attach:(GLenum)attachment texture:(id<GLPTexture>)texture
{
	[self attach:attachment texture:texture level:0];
}

- (void)attach:(GLenum)attachment texture:(id<GLPTexture>)texture level:(GLint)level
{
	[self bindFramebuffer];
	glFramebufferTexture2D(GL_FRAMEBUFFER, attachment, texture.GLTarget, texture.GLTexture, level);
}

- (void)attach:(GLenum)attachment renderbuffer:(GLPRenderbuffer *)renderbuffer
{
	[self bindFramebuffer];
	glFramebufferRenderbuffer(GL_FRAMEBUFFER, attachment, GL_RENDERBUFFER, renderbuffer.GLRenderbuffer);
}

- (void)detach:(GLenum)attachment
{
	[self bindFramebuffer];
	glFramebufferRenderbuffer(GL_FRAMEBUFFER, attachment, GL_RENDERBUFFER, 0);
}

- (BOOL)valid
{
	return self.status == GL_FRAMEBUFFER_COMPLETE;
}

- (GLenum)status
{
	[self bindFramebuffer];
	return glCheckFramebufferStatus(GL_FRAMEBUFFER);
}

#if 0
- (NSData*)readPixelsInRect:(CGRect)rect format:(EEGLPixelformat)pixelformat {
	int x = rect.origin.x;
	int y = rect.origin.y;
	int width = rect.size.width;
	int height = rect.size.height;
	
	NSUInteger length = eeglPixelformatGetBytesPerPixel(pixelformat) * width * height;
	
	GLuint format = eeglPixelformatGetFormat(pixelformat);
	GLuint type = eeglPixelformatGetType(pixelformat);
	
	NSMutableData* data = [NSMutableData dataWithLength:length];
	
	glReadPixels(x, y, width, height, format, type, data.mutableBytes);
	
	return data;
}
#endif

#pragma mark - EEGLFramebuffer

- (void)bindFramebuffer
{
	glBindFramebuffer(target, framebuffer);
}

- (void)unbindFramebuffer
{
	glBindFramebuffer(target, 0);
}

@synthesize GLTarget = target;
@synthesize GLFramebuffer = framebuffer;

@end
