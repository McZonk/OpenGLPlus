#pragma once

#include "GLPBase.h"


typedef enum GLPPixelformat {
	GLPPixelformatUnknown,
	
	// 1 channel
	GLPPixelformatAlpha8,
	GLPPixelformatLuminance8,
	GLPPixelformatRed8,
	
	// 2 channels
	GLPPixelformatLuminanceAlpha88,
	GLPPixelformatRedGreen8,

	// 3 channels
	GLPPixelformatRGB565,
	GLPPixelformatRGB888,
	
	// 4 channels
	GLPPixelformatRGBA4444,
	GLPPixelformatRGBA5551,
	GLPPixelformatRGBA8888,
	GLPPixelformatBGRA8888,
	
	// compressed
	GLPPixelformatPVRRGB2BPP,
	GLPPixelformatPVRRGB4BPP,
	GLPPixelformatPVRRGBA2BPP,
	GLPPixelformatPVRRGBA4BPP,
} GLPPixelformat;


GLP_EXTERNC GLenum glpPixelformatGetFormat(GLPPixelformat format);
GLP_EXTERNC GLenum glpPixelformatGetInternalFormat(GLPPixelformat format);
GLP_EXTERNC GLenum glpPixelformatGetType(GLPPixelformat format);

GLP_EXTERNC GLboolean glpPixelformatIsCompressed(GLPPixelformat format);

GLP_EXTERNC GLuint glpPixelformatGetBytesPerPixel(GLPPixelformat format);
