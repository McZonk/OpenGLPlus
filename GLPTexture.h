#import <Foundation/Foundation.h>

#import "GLPTextureBase.h"


@protocol GLPTexture <NSObject>
@required

@property (nonatomic, assign, readonly) GLenum GLTarget;
@property (nonatomic, assign, readonly) GLuint GLTexture;

- (void)bind;
- (void)bindToUnit:(GLenum)unit;
- (void)unbind;

@end


@interface GLPTexture : NSObject <GLPTexture>
{
@protected
	GLenum target;
	GLuint texture;
}

+ (instancetype)texture;
+ (instancetype)textureWithTarget:(GLenum)target;

+ (instancetype)textureWithFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height;
+ (instancetype)textureWithFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels;

- (instancetype)initWithTarget:(GLenum)target;
- (instancetype)initWithTarget:(GLenum)target texture:(GLuint)texture freeWhenDone:(BOOL)freeWhenDone; // designated constructor

- (instancetype)initWithFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height;
- (instancetype)initWithFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels;

- (void)setFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height;
- (void)setFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels;
- (void)setFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels level:(GLint)level;

- (void)setFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels target:(GLenum)target;
- (void)setFormat:(GLPPixelformat)format width:(GLsizei)width height:(GLsizei)height pixels:(const void *)pixels target:(GLenum)target level:(GLint)level;

- (void)setWrap:(GLenum)wrap;
- (void)setFilter:(GLenum)filter;
- (void)setMinFilter:(GLenum)minFilter magFilter:(GLenum)magFilter;

- (void)generateMipmap;

@end
