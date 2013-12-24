#import "GLPTexture+UIImage.h"

#import "GLPTexture+CGImage.h"


#if defined(TARGET_OS_IPHONE) && (TARGET_OS_IPHONE > 0)

@implementation GLPTexture (UIImage)

+ (instancetype)textureWithUIImage:(UIImage *)image
{
	return [[self alloc] initWithUIImage:image];
}

- (instancetype)initWithUIImage:(UIImage *)image
{
	self = [self init];
	if(self != nil)
	{
		if(![self setUIImage:image])
		{
			return nil;
		}
	}
	return self;
}

- (BOOL)setUIImage:(UIImage *)image
{
	return [self setCGImage:image.CGImage];
}

@end

#endif
