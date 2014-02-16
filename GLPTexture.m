#import "GLPTexture.h"

@interface GLPTexture ()
{
	BOOL freeWhenDone;
}

@end

@implementation GLPTexture

@synthesize GLTarget = target;
@synthesize GLTexture = texture;

+ (instancetype)texture
{
	return [[self alloc] init];
}

+ (instancetype)textureWithFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height
{
	return [[self alloc] initWithFormat:format width:width height:height];
}

+ (instancetype)textureWithFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels
{
	return [[self alloc] initWithFormat:format width:width height:height pixels:pixels];
}

- (instancetype)init
{
	return [self initWithGLTexture:glpTextureCreate(GL_TEXTURE_2D) freeWhenDone:YES];
}

- (instancetype)initWithGLTexture:(GLuint)texture_ freeWhenDone:(BOOL)freeWhenDone_
{
	self = [super init];
	if(self != nil)
	{
		if(texture_ == 0)
		{
			return nil;
		}

		target = GL_TEXTURE_2D;
		texture = texture_;
		freeWhenDone = freeWhenDone_;
	}
	return self;
}

- (instancetype)initWithFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height
{
	self = [self initWithFormat:format width:width height:height pixels:NULL];
	if(self != nil)
	{
		
	}
	return self;
}

- (instancetype)initWithFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels
{
	self = [self init];
	if(self != nil)
	{
		[self setFormat:format width:width height:height pixels:pixels];
	}
	return self;
}

- (void)dealloc
{
	if(freeWhenDone)
	{
		glpTextureDelete(texture), texture = 0;
	}
}

- (void)setFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height
{
	[self setFormat:format width:width height:height pixels:NULL];
}

- (void)setFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels
{
	[self setFormat:format width:width height:height pixels:pixels level:0];
}

- (void)setFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels level:(GLint)level
{
	glpTextureSetData(target, format, width, height, pixels, level);
}

- (void)setWrap:(GLenum)wrap
{
	glTexParameteri(target, GL_TEXTURE_WRAP_S, wrap);
	glTexParameteri(target, GL_TEXTURE_WRAP_T, wrap);
}

- (void)setFilter:(GLenum)filter
{
	glTexParameteri(target, GL_TEXTURE_MIN_FILTER, filter);
	glTexParameteri(target, GL_TEXTURE_MAG_FILTER, filter);
}

- (void)setMinFilter:(GLenum)minFilter magFilter:(GLenum)magFilter
{
	glTexParameteri(target, GL_TEXTURE_MIN_FILTER, minFilter);
	glTexParameteri(target, GL_TEXTURE_MAG_FILTER, magFilter);
}

- (void)generateMipmap
{
	glGenerateMipmap(target);
}

#pragma mark - EEGLTexture protocol

- (void)bind
{
	glBindTexture(target, texture);
}

- (void)bindToUnit:(GLenum)unit
{
	glpActiveTexture(unit);
	[self bind];
}

- (void)unbind
{
	glBindTexture(target, 0);
}

@end
