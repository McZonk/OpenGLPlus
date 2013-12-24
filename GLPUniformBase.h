#pragma once

#include "GLPBase.h"


GLP_EXTERNC void glpUniform1f(GLuint program, GLint location, GLfloat x);
GLP_EXTERNC void glpUniform2f(GLuint program, GLint location, GLfloat x, GLfloat y);
GLP_EXTERNC void glpUniform3f(GLuint program, GLint location, GLfloat x, GLfloat y, GLfloat z);
GLP_EXTERNC void glpUniform4f(GLuint program, GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w);

GLP_EXTERNC void glpUniform1fv(GLuint program, GLint location, GLsizei count, const GLfloat* v);
GLP_EXTERNC void glpUniform2fv(GLuint program, GLint location, GLsizei count, const GLfloat* v);
GLP_EXTERNC void glpUniform3fv(GLuint program, GLint location, GLsizei count, const GLfloat* v);
GLP_EXTERNC void glpUniform4fv(GLuint program, GLint location, GLsizei count, const GLfloat* v);

GLP_EXTERNC void glpUniform1i(GLuint program, GLint location, GLint x);
GLP_EXTERNC void glpUniform2i(GLuint program, GLint location, GLint x, GLint y);
GLP_EXTERNC void glpUniform3i(GLuint program, GLint location, GLint x, GLint y, GLint z);
GLP_EXTERNC void glpUniform4i(GLuint program, GLint location, GLint x, GLint y, GLint z, GLint w);

GLP_EXTERNC void glpUniform1iv(GLuint program, GLint location, GLsizei count, const GLint* v);
GLP_EXTERNC void glpUniform2iv(GLuint program, GLint location, GLsizei count, const GLint* v);
GLP_EXTERNC void glpUniform3iv(GLuint program, GLint location, GLsizei count, const GLint* v);
GLP_EXTERNC void glpUniform4iv(GLuint program, GLint location, GLsizei count, const GLint* v);

GLP_EXTERNC void glpUniformMatrix2fv(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
GLP_EXTERNC void glpUniformMatrix3fv(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);
GLP_EXTERNC void glpUniformMatrix4fv(GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat* value);

GLP_EXTERNC void glpUniformNamed1f(GLuint program, const GLchar* name, GLfloat x);
GLP_EXTERNC void glpUniformNamed2f(GLuint program, const GLchar* name, GLfloat x, GLfloat y);
GLP_EXTERNC void glpUniformNamed3f(GLuint program, const GLchar* name, GLfloat x, GLfloat y, GLfloat z);
GLP_EXTERNC void glpUniformNamed4f(GLuint program, const GLchar* name, GLfloat x, GLfloat y, GLfloat z, GLfloat w);

GLP_EXTERNC void glpUniformNamed1fv(GLuint program, const GLchar* name, GLsizei count, const GLfloat* v);
GLP_EXTERNC void glpUniformNamed2fv(GLuint program, const GLchar* name, GLsizei count, const GLfloat* v);
GLP_EXTERNC void glpUniformNamed3fv(GLuint program, const GLchar* name, GLsizei count, const GLfloat* v);
GLP_EXTERNC void glpUniformNamed4fv(GLuint program, const GLchar* name, GLsizei count, const GLfloat* v);

GLP_EXTERNC void glpUniformNamed1i(GLuint program, const GLchar* name, GLint x);
GLP_EXTERNC void glpUniformNamed2i(GLuint program, const GLchar* name, GLint x, GLint y);
GLP_EXTERNC void glpUniformNamed3i(GLuint program, const GLchar* name, GLint x, GLint y, GLint z);
GLP_EXTERNC void glpUniformNamed4i(GLuint program, const GLchar* name, GLint x, GLint y, GLint z, GLint w);

GLP_EXTERNC void glpUniformNamed1iv(GLuint program, const GLchar* name, GLsizei count, const GLint* v);
GLP_EXTERNC void glpUniformNamed2iv(GLuint program, const GLchar* name, GLsizei count, const GLint* v);
GLP_EXTERNC void glpUniformNamed3iv(GLuint program, const GLchar* name, GLsizei count, const GLint* v);
GLP_EXTERNC void glpUniformNamed4iv(GLuint program, const GLchar* name, GLsizei count, const GLint* v);

GLP_EXTERNC void glpUniformNamedMatrix2fv(GLuint program, const GLchar* name, GLsizei count, GLboolean transpose, const GLfloat* value);
GLP_EXTERNC void glpUniformNamedMatrix3fv(GLuint program, const GLchar* name, GLsizei count, GLboolean transpose, const GLfloat* value);
GLP_EXTERNC void glpUniformNamedMatrix4fv(GLuint program, const GLchar* name, GLsizei count, GLboolean transpose, const GLfloat* value);
