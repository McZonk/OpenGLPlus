#import "GLPRendertarget.h"


@interface GLPRendertarget ()

@property (nonatomic, strong, readwrite) GLPTexture *texture;
@property (nonatomic, strong, readwrite) GLPFramebuffer *framebuffer;

@property (nonatomic, assign, readwrite) GLuint width;
@property (nonatomic, assign, readwrite) GLuint height;

@end


@implementation GLPRendertarget

+ (instancetype)rendertargetWithTexture:(id<GLPTexture>)texture
{
	return [[self alloc] initWithTexture:texture];
}

+ (instancetype)rendertargetWithFormat:(GLPPixelformat)format width:(GLuint)width height:(GLuint)height
{
	return [[self alloc] initWithFormat:format width:width height:height];
}

- (instancetype)init
{
	return nil;
}

- (instancetype)initWithTexture:(id<GLPTexture>)texture
{
	self = [super init];
	if(self != nil)
	{
		self.texture = texture;
		
		self.framebuffer = [GLPFramebuffer framebuffer];
		[self.framebuffer attach:GL_COLOR_ATTACHMENT0 texture:texture];
	}
	return self;
}

- (instancetype)initWithFormat:(GLPPixelformat)format width:(GLuint)width height:(GLuint)height
{
	GLPTexture *texture = [GLPTexture textureWithFormat:format width:width height:height];
	
	self = [self initWithTexture:texture];
	if(self != nil)
	{
		self.width = width;
		self.height = height;
	}
	return self;
}

#pragma mark - GLPTexture

- (GLenum)GLTarget
{
	return self.texture.GLTarget;
}

- (GLuint)GLTexture
{
	return self.texture.GLTexture;
}

- (void)bind
{
	[self.texture bind];
}

- (void)bindToUnit:(GLenum)unit
{
	[self.texture bindToUnit:unit];
}

- (void)unbind
{
	[self.texture unbind];
}

#pragma mark - GLPFramebuffer

- (GLuint)GLFramebuffer
{
	return self.framebuffer.GLFramebuffer;
}

- (void)bindFramebuffer
{
	[self.framebuffer bindFramebuffer];
}

- (void)bindFramebufferAndSetViewport
{
	[self bindFramebuffer];
	glViewport(0, 0, self.width, self.height);
}

- (void)unbindFramebuffer
{
	[self.framebuffer unbindFramebuffer];
}

@end
