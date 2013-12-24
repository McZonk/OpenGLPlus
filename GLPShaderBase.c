#include "GLPShaderBase.h"

#include <stdlib.h>


GLboolean glpShaderGetCompileStatus(GLuint shader)
{
	GLint param = 0;
	
	glGetShaderiv(shader, GL_COMPILE_STATUS, &param);
	
	return param ? GL_TRUE : GL_FALSE;
}

GLint glpShaderGetInfoLogLength(GLuint shader)
{
	GLint param = 0;
	
	glGetShaderiv(shader, GL_INFO_LOG_LENGTH, &param);
	
	return param;
}

char *glpShaderCopyInfoLog(GLuint shader)
{
	GLsizei length = glpShaderGetInfoLogLength(shader);
	
	char *infoLog = (char *)malloc(length);
	
	glGetShaderInfoLog(shader, length, 0, infoLog);
	
	return infoLog;
}

GLboolean glpShaderCompileSource(GLuint shader, const char *text)
{
	const char *source = text;
	
	glShaderSource(shader, 1, &source, 0);
	
	glCompileShader(shader);
	
	return glpShaderGetCompileStatus(shader);
}
