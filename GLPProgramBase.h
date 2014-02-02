#pragma once

#include "GLPBase.h"


GLP_EXTERNC GLboolean glpProgramGetLinkStatus(GLuint program);

GLP_EXTERNC GLint glpProgramGetInfoLogLength(GLuint program);

GLP_EXTERNC GLchar* glpProgramCopyInfoLog(GLuint program);

GLP_EXTERNC GLboolean glpProgramLink(GLuint program);
