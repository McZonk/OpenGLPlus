#include "GLPTextureBase.h"

#include <stdio.h>


GLuint glpTextureCreate(const GLenum target)
{
	GLuint texture = 0;
	
	glGenTextures(1, &texture);
	
	if(texture != 0)
	{
		glpTextureSetDefaults(target, texture);
	}
	
	return texture;
}

void glpTextureDelete(GLuint texture)
{
	glDeleteTextures(1, &texture);
}

void glpTextureSetDefaults(GLenum target, GLuint texture)
{
	glBindTexture(target, texture);
	
	// this will ensure no mipmaps are needed
	glTexParameteri(target, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	
	// clamp to edge will enable non-power of two textures
	glTexParameteri(target, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
	glTexParameteri(target, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
	if(target == GL_TEXTURE_CUBE_MAP)
	{
		glTexParameteri(target, GL_TEXTURE_WRAP_R, GL_CLAMP_TO_EDGE);
	}
}

int glpTextureSetData(GLenum target, GLPPixelformat pixelformat, GLsizei width, GLsizei height, const void* pixels, GLint level) {
	//printf("eeglTextureSetData %d %d x %d %p\n", format, width, height, pixels);
	
	const GLboolean compressed = glpPixelformatIsCompressed(pixelformat);
	const GLenum internalFormat = glpPixelformatGetInternalFormat(pixelformat);
	const GLenum format = glpPixelformatGetFormat(pixelformat);
	const GLenum type = glpPixelformatGetType(pixelformat);
	
	if(format == GL_NONE || internalFormat == GL_NONE || type == GL_NONE) {
		printf("%s:%d warning: Unhandled Format: %d", __FILE__, __LINE__, pixelformat);
		return 0;
	}
	
	if(compressed) {
		glCompressedTexImage2D(target, level, format, width, height, 0, width * height / 2 /* 4 */, pixels);
		return 1;
	}
	
	glTexImage2D(target, level, internalFormat, width, height, 0, format, type, pixels);
	return 1;
}

void glpActiveTexture(GLenum unit) {
	if(unit < GL_TEXTURE0) {
		unit += GL_TEXTURE0;
	}
	
	glActiveTexture(unit);
}