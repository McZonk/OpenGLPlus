#import "GLPObjectLabel.h"

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)

NSString *GLPGetObjectLabelString(GLenum type, GLuint object)
{
#if 0
	char string[96];
	GLsizei length = 0;
	
	glGetObjectLabelEXT(type, object, sizeof(string), &length, string);
	
	return length != 0 ? [[NSString alloc] initWithUTF8String:string] : nil;
#else
	return nil;
#endif
}

void GLPSetObjectLabelString(GLenum type, GLuint object, NSString *label)
{
#if 0
	const char *string = label.UTF8String;
	GLsizei length = (GLsizei)strlen(string);
	
	glLabelObjectEXT(type, object, length, string);
#endif
}

#endif
