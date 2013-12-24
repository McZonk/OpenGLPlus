#import "GLPBuffer.h"


@implementation GLPBuffer

+ (instancetype)arrayBuffer
{
	return [[self alloc] initWithTarget:GL_ARRAY_BUFFER];
}

+ (instancetype)elementArrayBuffer
{
	return [[self alloc] initWithTarget:GL_ELEMENT_ARRAY_BUFFER];
}

- (instancetype)init
{
	return [self initWithTarget:GL_ARRAY_BUFFER];
}

- (instancetype)initWithTarget:(GLenum)target_
{
	self = [super init];
	if(self != nil)
	{
		target = target_;

		glGenBuffers(1, &buffer);
		if(buffer == 0)
		{
			return nil;
		}
	}
	return self;
}

- (void)dealloc
{
	if(buffer != 0)
	{
		glDeleteBuffers(1, &buffer);
	}
}

@synthesize GLTarget = target;
@synthesize GLBuffer = buffer;

- (void)bind
{
	glBindBuffer(target, buffer);
}

- (void)unbind
{
	glBindBuffer(target, 0);
}

- (void)setBufferData:(const GLvoid *)data size:(GLsizeiptr)size usage:(GLenum)usage
{
	[self bind];
	glBufferData(target, size, data, usage);
}

- (void)setBufferSubData:(const GLvoid *)data offset:(GLintptr)offset size:(GLsizeiptr)size
{
	[self bind];
	glBufferSubData(target, offset, size, data);
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@: %p target:0x%04X object:%u>", self.class, self, target, buffer];
}

#pragma mark - GLPObjectLabel

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_BUFFER_OBJECT_EXT, buffer);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_BUFFER_OBJECT_EXT, buffer, objectLabel);
}
#endif /* GL_EXT_debug_label */

@end
