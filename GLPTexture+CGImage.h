#import "GLPTexture.h"

#import <CoreGraphics/CoreGraphics.h>


@interface GLPTexture (CGImage)

+ (id)textureWithCGImage:(CGImageRef)image;

- (id)initWithCGImage:(CGImageRef)image;

- (BOOL)setCGImage:(CGImageRef)image;

@end
