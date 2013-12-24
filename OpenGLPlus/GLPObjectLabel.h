#import <Foundation/Foundation.h>

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)

NSString *GLPGetObjectLabelString(GLenum type, GLuint object);
void GLPSetObjectLabelString(GLenum type, GLuint object, NSString *label);

#endif /* GL_EXT_debug_label */


@protocol GLPObjectLabel <NSObject>
@required

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
@property (nonatomic, copy) NSString *objectLabel;
#endif /* GL_EXT_debug_label */

@end
