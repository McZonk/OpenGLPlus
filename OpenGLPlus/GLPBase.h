#pragma once

#ifdef __cplusplus
#define GLP_EXTERNC extern "C"
#else
#define GLP_EXTERNC
#endif

#define GLP_CHECKERROR() \
{ \
	GLenum error = glGetError(); \
	if(error != 0) { \
		printf("%s:%d: error: 0x%04X %s\n", __FILE__, __LINE__, error, glGetString(error)); \
	} \
}

GLP_EXTERNC const GLchar* glpTypeName(const GLenum type);
