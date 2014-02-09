#import <Foundation/Foundation.h>


@interface GLPSync : NSObject

+ (instancetype)sync;

- (BOOL)signaled;

- (GLenum)clientWait:(NSTimeInterval)timeout;
- (void)wait:(NSTimeInterval)timeout;

@end
