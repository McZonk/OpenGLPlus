#import <Foundation/Foundation.h>


@interface GLPSync : NSObject

+ (instancetype)sync;

+ (GLenum)syncWithClientWait:(NSTimeInterval)timeout;
+ (void)syncWithWait:(NSTimeInterval)timeout;

- (BOOL)signaled;

- (GLenum)clientWait:(NSTimeInterval)timeout;
- (void)wait:(NSTimeInterval)timeout;

@end
