#include "glpProgramBase.h"

#include <stdlib.h>


GLboolean glpProgramGetLinkStatus(GLuint program)
{
	GLint param = 0;
	
	glGetProgramiv(program, GL_LINK_STATUS, &param);
	
	return param ? GL_TRUE : GL_FALSE;
}

GLint glpProgramGetInfoLogLength(GLuint program)
{
	GLint param = 0;
	
	glGetProgramiv(program, GL_INFO_LOG_LENGTH, &param);
	
	return param;
}

char* glpProgramCopyInfoLog(GLuint program)
{
	GLsizei length = glpProgramGetInfoLogLength(program);
	
	char *infoLog = (char *)malloc(length);
	
	glGetProgramInfoLog(program, length, 0, infoLog);
	
	return infoLog;
}

GLboolean glpProgramLink(GLuint program)
{
	glLinkProgram(program);
	
	return glpProgramGetLinkStatus(program);
}
