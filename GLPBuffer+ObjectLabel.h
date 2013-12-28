#import "GLPBuffer.h"

@interface GLPBuffer (ObjectLabel)

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
@property (nonatomic, copy) NSString *objectLabel;
#endif

@end
