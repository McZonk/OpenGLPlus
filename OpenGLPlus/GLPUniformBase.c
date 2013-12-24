#include "GLPUniformBase.h"


void glpUniform1f(GLuint program, GLint location, GLfloat x)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform1fEXT(program, location, x);
#else
	glUseProgram(program);
	glUniform1f(location, x);
#endif
}

void glpUniform2f(GLuint program, GLint location, GLfloat x, GLfloat y)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform2fEXT(program, location, x, y);
#else
	glUseProgram(program);
	glUniform2f(location, x, y);
#endif
}

void glpUniform3f(GLuint program, GLint location, GLfloat x, GLfloat y, GLfloat z)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform3fEXT(program, location, x, y, z);
#else
	glUseProgram(program);
	glUniform3f(location, x, y, z);
#endif
}

void glpUniform4f(GLuint program, GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform4fEXT(program, location, x, y, z, w);
#else
	glUseProgram(program);
	glUniform4f(location, x, y, z, w);
#endif
}

void glpUniform1fv(GLuint program, GLint location, GLsizei count, const GLfloat* v)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform1fvEXT(program, location, count, v);
#else
	glUseProgram(program);
	glUniform1fv(location, count, v);
#endif
}

void glpUniform2fv(GLuint program, GLint location, GLsizei count, const GLfloat* v)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform2fvEXT(program, location, count, v);
#else
	glUseProgram(program);
	glUniform2fv(location, count, v);
#endif
}

void glpUniform3fv(GLuint program, GLint location, GLsizei count, const GLfloat* v)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform3fvEXT(program, location, count, v);
#else
	glUseProgram(program);
	glUniform3fv(location, count, v);
#endif
}

void glpUniform4fv(GLuint program, GLint location, GLsizei count, const GLfloat* v)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform4fvEXT(program, location, count, v);
#else
	glUseProgram(program);
	glUniform4fv(location, count, v);
#endif
}

void glpUniform1i(GLuint program, GLint location, GLint x)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform1iEXT(program, location, x);
#else
	glUseProgram(program);
	glUniform1i(location, x);
#endif
}

void glpUniform2i(GLuint program, GLint location, GLint x, GLint y)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform2iEXT(program, location, x, y);
#else
	glUseProgram(program);
	glUniform2i(location, x, y);
#endif
}

void glpUniform3i(GLuint program, GLint location, GLint x, GLint y, GLint z)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform3iEXT(program, location, x, y, z);
#else
	glUseProgram(program);
	glUniform3i(location, x, y, z);
#endif
}

void glpUniform4i(GLuint program, GLint location, GLint x, GLint y, GLint z, GLint w)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform4iEXT(program, location, x, y, z, w);
#else
	glUseProgram(program);
	glUniform4i(location, x, y, z, w);
#endif
}

void glpUniform1iv(GLuint program, GLint location, GLsizei count, const GLint* v)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform1ivEXT(program, location, count, v);
#else
	glUseProgram(program);
	glUniform1iv(location, count, v);
#endif
	
}

void glpUniform2iv(GLuint program, GLint location, GLsizei count, const GLint* v)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform2ivEXT(program, location, count, v);
#else
	glUseProgram(program);
	glUniform2iv(location, count, v);
#endif
	
}

void glpUniform3iv(GLuint program, GLint location, GLsizei count, const GLint* v)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform3ivEXT(program, location, count, v);
#else
	glUseProgram(program);
	glUniform3iv(location, count, v);
#endif
	
}

void glpUniform4iv(GLuint program, GLint location, GLsizei count, const GLint* v)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniform4ivEXT(program, location, count, v);
#else
	glUseProgram(program);
	glUniform4iv(location, count, v);
#endif
}

void glpUniformMatrix2fv(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniformMatrix2fvEXT(program, location, count, transpose, value);
#else
	glUseProgram(program);
	glUniformMatrix2fv(location, count, transpose, value);
#endif
}

void glpUniformMatrix3fv(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniformMatrix3fvEXT(program, location, count, transpose, value);
#else
	glUseProgram(program);
	glUniformMatrix3fv(location, count, transpose, value);
#endif
}

void glpUniformMatrix4fv(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value)
{
#if defined(GL_EXT_separate_shader_objects) && (GL_EXT_separate_shader_objects > 0)
	glProgramUniformMatrix4fvEXT(program, location, count, transpose, value);
#else
	glUseProgram(program);
	glUniformMatrix4fv(location, count, transpose, value);
#endif
}

void glpUniformNamed1f(GLuint program, const GLchar* name, GLfloat x)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform1f(program, location, x);
	}
}

void glpUniformNamed2f(GLuint program, const GLchar* name, GLfloat x, GLfloat y)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform2f(program, location, x, y);
	}
}

void glpUniformNamed3f(GLuint program, const GLchar* name, GLfloat x, GLfloat y, GLfloat z)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform3f(program, location, x, y, z);
	}
}

void glpUniformNamed4f(GLuint program, const GLchar* name, GLfloat x, GLfloat y, GLfloat z, GLfloat w)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform4f(program, location, x, y, z, w);
	}
}

void glpUniformNamed1fv(GLuint program, const GLchar* name, GLsizei count, const GLfloat* v)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform1fv(program, location, count, v);
	}
}

void glpUniformNamed2fv(GLuint program, const GLchar* name, GLsizei count, const GLfloat* v)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform2fv(program, location, count, v);
	}
}

void glpUniformNamed3fv(GLuint program, const GLchar* name, GLsizei count, const GLfloat* v)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform3fv(program, location, count, v);
	}
}

void glpUniformNamed4fv(GLuint program, const GLchar* name, GLsizei count, const GLfloat* v)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform4fv(program, location, count, v);
	}
}

void glpUniformNamed1i(GLuint program, const GLchar* name, GLint x)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform1i(program, location, x);
	}
}

void glpUniformNamed2i(GLuint program, const GLchar* name, GLint x, GLint y)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform2i(program, location, x, y);
	}
}

void glpUniformNamed3i(GLuint program, const GLchar* name, GLint x, GLint y, GLint z)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform3i(program, location, x, y, z);
	}
}

void glpUniformNamed4i(GLuint program, const GLchar* name, GLint x, GLint y, GLint z, GLint w)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform4i(program, location, x, y, z, w);
	}
}

void glpUniformNamed1iv(GLuint program, const GLchar* name, GLsizei count, const GLint* v)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform1iv(program, location, count, v);
	}
}

void glpUniformNamed2iv(GLuint program, const GLchar* name, GLsizei count, const GLint* v)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform2iv(program, location, count, v);
	}
}

void glpUniformNamed3iv(GLuint program, const GLchar* name, GLsizei count, const GLint* v)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform3iv(program, location, count, v);
	}
}

void glpUniformNamed4iv(GLuint program, const GLchar* name, GLsizei count, const GLint* v)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniform4iv(program, location, count, v);
	}
}

void glpUniformNamedMatrix2fv(GLuint program, const GLchar* name, GLsizei count, GLboolean transpose, const GLfloat* value)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniformMatrix2fv(program, location, count, transpose, value);
	}
}

void glpUniformNamedMatrix3fv(GLuint program, const GLchar* name, GLsizei count, GLboolean transpose, const GLfloat* value)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniformMatrix3fv(program, location, count, transpose, value);
	}
}

void glpUniformNamedMatrix4fv(GLuint program, const GLchar* name, GLsizei count, GLboolean transpose, const GLfloat* value)
{
	GLint location = glGetUniformLocation(program, name);
	if(location != -1)
	{
		glpUniformMatrix4fv(program, location, count, transpose, value);
	}
}
