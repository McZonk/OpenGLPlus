#import <Foundation/Foundation.h>

#import "GLPPixelformat.h"
#import "GLPTexture.h"
#import "GLPRenderbuffer.h"


@protocol GLPFramebuffer <NSObject>
@required

@property (nonatomic, assign, readonly) GLenum GLTarget;
@property (nonatomic, assign, readonly) GLuint GLFramebuffer;

- (void)bindFramebuffer;

@end


@interface GLPFramebuffer : NSObject <GLPFramebuffer>
{
	GLenum target;
	GLuint framebuffer;
}

+ (instancetype)framebuffer;

- (void)attach:(GLenum)attachment texture:(id<GLPTexture>)texture;
- (void)attach:(GLenum)attachment texture:(id<GLPTexture>)texture level:(GLint)level;
- (void)attach:(GLenum)attachment renderbuffer:(GLPRenderbuffer *)renderbuffer;

- (void)detach:(GLenum)attachment;

- (BOOL)valid;
- (GLenum)status;

#if 0
//- (NSData *)readPixelsInRect:(CGRect)rect format:(GLPPixelformat)pixelformat;
#endif

@end
