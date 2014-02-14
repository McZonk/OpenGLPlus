#import <Foundation/Foundation.h>


@interface GLPSync : NSObject
{
@protected
	GLsync sync;
}

+ (instancetype)sync;

@property (nonatomic, assign, readonly) GLsync GLSync;

+ (GLenum)syncWithClientWait:(NSTimeInterval)timeout;
+ (void)syncWithWait:(NSTimeInterval)timeout;

- (BOOL)signaled;

- (GLenum)clientWait:(NSTimeInterval)timeout;
- (void)wait:(NSTimeInterval)timeout;

@end
