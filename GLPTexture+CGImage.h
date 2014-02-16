#import "GLPTexture.h"

#import <CoreGraphics/CoreGraphics.h>


@interface GLPTexture (CGImage)

+ (id)textureWithCGImage:(CGImageRef)image;

- (id)initWithCGImage:(CGImageRef)image;

- (BOOL)setCGImage:(CGImageRef)image;

- (BOOL)setCGImage:(CGImageRef)image target:(GLenum)target;

@end
