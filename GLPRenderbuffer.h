#import <Foundation/Foundation.h>

#import "GLPPixelformat.h"


@interface GLPRenderbuffer : NSObject
{
	GLenum target;
	GLuint renderbuffer;
}

+ (instancetype)renderbuffer;

- (void)bind;

- (void)setPixelformat:(GLPPixelformat)pixelformat width:(GLuint)width height:(GLuint)height;

@property (nonatomic, assign, readonly) GLenum GLTarget;
@property (nonatomic, assign, readonly) GLuint GLRenderbuffer;

@end
