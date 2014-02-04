#import <OpenGLES/EAGL.h>

@interface EAGLPContextStack : NSObject

- (BOOL)pushCurrentContext:(EAGLContext *)context;
- (void)popCurrentContext;

@end
