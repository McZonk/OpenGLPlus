#import "GLPObjectLabel.h"

#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)

NSString *GLPGetObjectLabelString(GLenum type, GLuint object)
{
	char string[96];
	GLsizei length = 0;
	
	glGetObjectLabelEXT(type, object, sizeof(string), &length, string);
	
	return length != 0 ? [[NSString alloc] initWithUTF8String:string] : nil;
}

void GLPSetObjectLabelString(GLenum type, GLuint object, NSString *label)
{
	const char *string = label.UTF8String;
	GLsizei length = (GLsizei)strlen(string);
	
	glLabelObjectEXT(type, object, length, string);
}

#endif
