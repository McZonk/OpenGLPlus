#import "GLPSync.h"

@interface GLPSync () {
	GLsync sync;
}

@end


@implementation GLPSync

+ (instancetype)sync
{
	return [[self alloc] init];
}

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
		sync = glFenceSyncAPPLE(GL_SYNC_GPU_COMMANDS_COMPLETE_APPLE, 0);
	}
	return self;
}

- (void)dealloc
{
	if(sync != NULL)
	{
		glDeleteSyncAPPLE(sync);
	}
}

- (BOOL)signaled
{
	GLint value = 0;
	glGetSyncivAPPLE(sync, GL_SYNC_STATUS_APPLE, sizeof(value), NULL, &value);
	return value == GL_SIGNALED_APPLE;
}

- (GLenum)clientWait:(NSTimeInterval)timeout
{
	return glClientWaitSyncAPPLE(sync, GL_SYNC_FLUSH_COMMANDS_BIT_APPLE, timeout * NSEC_PER_SEC);
}

- (void)wait:(NSTimeInterval)timeout
{
	glWaitSyncAPPLE(sync, 0, timeout * NSEC_PER_SEC);
}

@end
