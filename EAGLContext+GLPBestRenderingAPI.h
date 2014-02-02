#import <OpenGLES/EAGL.h>

@interface EAGLContext (GLPBestRenderingAPI)

+ (instancetype)contextWithBestRenderingAPI;
+ (instancetype)contextWithBestRenderingAPISharegroup:(EAGLSharegroup *)sharegroup;

@end
