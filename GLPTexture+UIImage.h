#import "GLPTexture.h"

#import <Availability.h>

#if defined(TARGET_OS_IPHONE) && (TARGET_OS_IPHONE > 0)

#import <UIKit/UIKit.h>


@interface GLPTexture (UIImage)

+ (instancetype)textureWithUIImage:(UIImage *)image;

- (instancetype)initWithUIImage:(UIImage *)image;

- (BOOL)setUIImage:(UIImage *)image;
- (BOOL)setUIImage:(UIImage *)image target:(GLenum)target;

@end

#endif
