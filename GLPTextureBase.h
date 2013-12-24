#pragma once

#include "GLPBase.h"
#include "GLPPixelformat.h"


GLP_EXTERNC GLuint glpTextureCreate(GLenum target);
GLP_EXTERNC void glpTextureDelete(GLuint texture);

GLP_EXTERNC void glpTextureSetDefaults(GLenum target, GLuint texture);

GLP_EXTERNC int glpTextureSetData(GLenum target, GLPPixelformat pixelformat, GLsizei width, GLsizei height, const void* data, GLint level);

GLP_EXTERNC void glpActiveTexture(GLenum unit);
