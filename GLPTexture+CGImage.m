#import "GLPTexture+CGImage.h"

@implementation GLPTexture (CGImage)

+ (id)textureWithCGImage:(CGImageRef)image
{
	return [[self alloc] initWithCGImage:image];
}

- (id)initWithCGImage:(CGImageRef)image
{
	self = [self init];
	if(self != nil) {
		if(![self setCGImage:image])
		{
			return nil;
		}
	}
	return self;
}

- (BOOL)setCGImage:(CGImageRef)image
{
	return [self setCGImage:image target:target];
}

- (BOOL)setCGImage:(CGImageRef)image target:(GLenum)target_
{
	if(image == NULL)
	{
		return NO;
	}
	
	const size_t width = CGImageGetWidth(image);
	const size_t height = CGImageGetHeight(image);
	
	const size_t components = CGImageGetBitsPerPixel(image) / CGImageGetBitsPerComponent(image);
	
	GLPPixelformat format = GLPPixelformatUnknown;
	void *data = NULL;
	CGContextRef context = NULL;
	
	switch(components) {
		case 1 :
		{
			format = GLPPixelformatLuminance8;
			
			data = malloc(width * height);
			
			CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
			context = CGBitmapContextCreate(data, width, height, 8, width, colorSpace, (CGBitmapInfo)kCGImageAlphaNone);
			CGColorSpaceRelease(colorSpace);
			
			break;
		}
			
		case 2 :
		{
			format = GLPPixelformatLuminanceAlpha88;
			
			data = malloc(width * height * 2);
			
			CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
			context = CGBitmapContextCreate(data, width, height, 8, width * 2, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
			CGColorSpaceRelease(colorSpace);
			
			break;
		}
			
		case 4 :
		{
			format = GLPPixelformatRGBA8888;
			
			data = malloc(width * height * 4);
			
			CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
			context = CGBitmapContextCreate(data, width, height, 8, width * 4, colorSpace, (CGBitmapInfo)kCGImageAlphaPremultipliedLast);
			CGColorSpaceRelease(colorSpace);
			
			break;
		}
			
		default :
			NSLog(@"Unable to assign texture");
			return NO;
	}
	
	CGRect rect = CGRectMake(0, 0, width, height);
	
	CGContextClearRect(context, rect);
	CGContextDrawImage(context, rect, image);
	
	[self setFormat:format width:(GLsizei)width height:(GLsizei)height pixels:data target:target_];
	
	CGContextRelease(context), context = NULL;
	free(data), data = NULL;
	
	return YES;
}

@end
