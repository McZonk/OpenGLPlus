#import "GLPSync.h"

@implementation GLPSync

+ (instancetype)sync
{
	return [[self alloc] init];
}

+ (GLenum)syncWithClientWait:(NSTimeInterval)timeout
{
	return [[self sync] clientWait:timeout];
}

+ (void)syncWithWait:(NSTimeInterval)timeout
{
	[[self sync] wait:timeout];
}

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
#ifdef GL3_PROTOTYPES
		sync = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, 0);
#else
		sync = glFenceSyncAPPLE(GL_SYNC_GPU_COMMANDS_COMPLETE_APPLE, 0);
#endif
	}
	return self;
}

- (void)dealloc
{
	if(sync != NULL)
	{
#ifdef GL3_PROTOTYPES
		glDeleteSync(sync);
#else
		glDeleteSyncAPPLE(sync);
#endif
	}
}

@synthesize GLSync = sync;

- (BOOL)signaled
{
	GLint value = 0;
#ifdef GL3_PROTOTYPES
	glGetSynciv(sync, GL_SYNC_STATUS, sizeof(value), NULL, &value);
	return value == GL_SIGNALED;
#else
	glGetSyncivAPPLE(sync, GL_SYNC_STATUS_APPLE, sizeof(value), NULL, &value);
	return value == GL_SIGNALED_APPLE;
#endif
}

- (GLenum)clientWait:(NSTimeInterval)timeout
{
#ifdef GL3_PROTOTYPES
	return glClientWaitSync(sync, GL_SYNC_FLUSH_COMMANDS_BIT, timeout * NSEC_PER_SEC);
#else
	return glClientWaitSyncAPPLE(sync, GL_SYNC_FLUSH_COMMANDS_BIT_APPLE, timeout * NSEC_PER_SEC);
#endif
}

- (void)wait:(NSTimeInterval)timeout
{
#ifdef GL3_PROTOTYPES
	glWaitSync(sync, 0, timeout * NSEC_PER_SEC);
#else
	glWaitSyncAPPLE(sync, 0, timeout * NSEC_PER_SEC);
#endif
}

@end
