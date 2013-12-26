#import <Foundation/Foundation.h>

#import "GLPPixelformat.h"
#import "GLPTexture.h"
#import "GLPFramebuffer.h"


@interface GLPRendertarget : NSObject <GLPTexture, GLPFramebuffer>

+ (instancetype)rendertargetWithTexture:(id<GLPTexture>)texture;
+ (instancetype)rendertargetWithFormat:(GLPPixelformat)format width:(GLuint)width height:(GLuint)height;

- (instancetype)initWithTexture:(id<GLPTexture>)texture;
- (instancetype)initWithFormat:(GLPPixelformat)format width:(GLuint)width height:(GLuint)height;

@property (nonatomic, strong, readonly) GLPTexture* texture;
@property (nonatomic, strong, readonly) GLPFramebuffer* framebuffer;

@property (nonatomic, assign, readonly) GLuint width;
@property (nonatomic, assign, readonly) GLuint height;

- (void)bindFramebufferAndSetViewport;

@end
