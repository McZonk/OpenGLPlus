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

GLchar *glpShaderCopyInfoLog(GLuint shader)
{
	GLsizei length = glpShaderGetInfoLogLength(shader);
	
	GLchar *infoLog = (GLchar *)malloc(length * sizeof(GLchar));
	
	glGetShaderInfoLog(shader, length, 0, infoLog);
	
	return infoLog;
}

GLboolean glpShaderCompileSource(GLuint shader, const GLchar *source)
{
	glShaderSource(shader, 1, &source, 0);
	
	glCompileShader(shader);
	
	return glpShaderGetCompileStatus(shader);
}
