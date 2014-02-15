#import "GLPBuffer.h"

#import "GLPObjectLabel.h"


@interface GLPBuffer (ObjectLabel) <GLPObjectLabel>

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
@property (nonatomic, copy) NSString *objectLabel;
#endif

@end
