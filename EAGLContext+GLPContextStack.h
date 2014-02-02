#import <OpenGLES/EAGL.h>

@interface EAGLContext (GLPContextStack)

+ (BOOL)pushCurrentContext:(EAGLContext *)context;
+ (void)popCurrentContext;

@end
