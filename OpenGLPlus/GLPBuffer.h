#import <Foundation/Foundation.h>

#import "GLPObjectLabel.h"


@interface GLPBuffer : NSObject <GLPObjectLabel>
{
@private
	GLenum target;
	GLuint buffer;
}

+ (instancetype)arrayBuffer;
+ (instancetype)elementArrayBuffer;

- (instancetype)init;
- (instancetype)initWithTarget:(GLenum)target;

@property (nonatomic, assign) GLenum GLTarget;
@property (nonatomic, assign) GLuint GLBuffer;

- (void)bind;
- (void)unbind;

/**
 * Will bind buffer
 */
- (void)setBufferData:(const GLvoid *)data size:(GLsizeiptr)size usage:(GLenum)usage;

/**
 * Will bind buffer
 */
- (void)setBufferSubData:(const GLvoid *)data offset:(GLintptr)offset size:(GLsizeiptr)size;

@end
