#pragma once

#include "GLPBase.h"


GLP_EXTERNC GLboolean glpShaderGetCompileStatus(GLuint shader);

GLP_EXTERNC GLint glpShaderGetInfoLogLength(GLuint shader);

GLP_EXTERNC GLchar *glpShaderCopyInfoLog(GLuint shader);

GLP_EXTERNC GLboolean glpShaderCompileSource(GLuint shader, const GLchar *source);
