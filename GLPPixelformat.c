#include "GLPPixelformat.h"

GLenum glpPixelformatGetFormat(GLPPixelformat format) {
	switch(format) {
		case GLPPixelformatAlpha8:
			return GL_ALPHA;
		case GLPPixelformatLuminance8:
			return GL_LUMINANCE;
		case GLPPixelformatRed8:
			return GL_RED_EXT;
			
		case GLPPixelformatLuminanceAlpha88:
			return GL_LUMINANCE_ALPHA;
		case GLPPixelformatRedGreen8:
			return GL_RG_EXT;
			
		case GLPPixelformatRGB565:
			return GL_RGB565;
		case GLPPixelformatRGB888:
			return GL_RGB;
		
		case GLPPixelformatRGBA4444:
			return GL_RGBA4;
		case GLPPixelformatRGBA5551:
			return GL_RGB5_A1;
		case GLPPixelformatRGBA8888:
			return GL_RGBA;
		case GLPPixelformatBGRA8888:
			return GL_BGRA;
			
		case GLPPixelformatPVRRGB2BPP:
			return GL_COMPRESSED_RGB_PVRTC_2BPPV1_IMG;
		case GLPPixelformatPVRRGB4BPP:
			return GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG;
		case GLPPixelformatPVRRGBA2BPP:
			return GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG;
		case GLPPixelformatPVRRGBA4BPP:
			return GL_COMPRESSED_RGBA_PVRTC_4BPPV1_IMG;

		default:
			return GL_NONE;
	}
}

GLenum glpPixelformatGetInternalFormat(GLPPixelformat format) {
	switch(format) {
		case GLPPixelformatAlpha8:
			return GL_ALPHA;
		case GLPPixelformatLuminance8:
			return GL_LUMINANCE;
		case GLPPixelformatRed8:
			return GL_RED_EXT;
			
		case GLPPixelformatLuminanceAlpha88:
			return GL_LUMINANCE_ALPHA;
		case GLPPixelformatRedGreen8:
			return GL_RG_EXT;
			
		case GLPPixelformatRGB565:
			return GL_RGB565;
		case GLPPixelformatRGB888:
			return GL_RGB;
			
		case GLPPixelformatRGBA4444:
			return GL_RGBA4;
		case GLPPixelformatRGBA5551:
			return GL_RGB5_A1;
		case GLPPixelformatRGBA8888:
			return GL_RGBA;
		case GLPPixelformatBGRA8888:
			return GL_RGBA;
			
		case GLPPixelformatPVRRGB2BPP:
			return GL_COMPRESSED_RGB_PVRTC_2BPPV1_IMG;
		case GLPPixelformatPVRRGB4BPP:
			return GL_COMPRESSED_RGB_PVRTC_4BPPV1_IMG;
		case GLPPixelformatPVRRGBA2BPP:
			return GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG;
		case GLPPixelformatPVRRGBA4BPP:
			return GL_COMPRESSED_RGBA_PVRTC_2BPPV1_IMG;
			
		default:
			return GL_NONE;
	}
}

GLenum glpPixelformatGetType(GLPPixelformat format) {
	switch(format) {
		case GLPPixelformatAlpha8:
			return GL_UNSIGNED_BYTE;
		case GLPPixelformatLuminance8:
			return GL_UNSIGNED_BYTE;
		case GLPPixelformatRed8:
			return GL_UNSIGNED_BYTE;
			
		case GLPPixelformatLuminanceAlpha88:
			return GL_UNSIGNED_BYTE;
		case GLPPixelformatRedGreen8:
			return GL_UNSIGNED_BYTE;
			
		case GLPPixelformatRGB565:
			return GL_UNSIGNED_SHORT_5_6_5;
		case GLPPixelformatRGB888:
			return GL_UNSIGNED_BYTE;
			
		case GLPPixelformatRGBA4444:
			return GL_UNSIGNED_SHORT_4_4_4_4;
		case GLPPixelformatRGBA5551:
			return GL_UNSIGNED_SHORT_5_5_5_1;
		case GLPPixelformatRGBA8888:
			return GL_UNSIGNED_BYTE;
		case GLPPixelformatBGRA8888:
			return GL_UNSIGNED_BYTE;
			
		case GLPPixelformatPVRRGB2BPP:
			return GL_UNSIGNED_BYTE;
		case GLPPixelformatPVRRGB4BPP:
			return GL_UNSIGNED_BYTE;
		case GLPPixelformatPVRRGBA2BPP:
			return GL_UNSIGNED_BYTE;
		case GLPPixelformatPVRRGBA4BPP:
			return GL_UNSIGNED_BYTE;
			
		default:
			return GL_NONE;
	}
}

GLboolean glpPixelformatIsCompressed(GLPPixelformat format) {
	switch(format) {
		case GLPPixelformatPVRRGB2BPP:
			return GL_TRUE;
		case GLPPixelformatPVRRGB4BPP:
			return GL_TRUE;
		case GLPPixelformatPVRRGBA2BPP:
			return GL_TRUE;
		case GLPPixelformatPVRRGBA4BPP:
			return GL_TRUE;
		default:
			return GL_FALSE;
	}
}

GLuint glpPixelformatGetBytesPerPixel(GLPPixelformat format) {
	switch (format) {
		case GLPPixelformatAlpha8:
			return 1;
		case GLPPixelformatLuminance8:
			return 1;
		case GLPPixelformatRed8:
			return 1;
			
		case GLPPixelformatLuminanceAlpha88:
			return 2;
		case GLPPixelformatRedGreen8:
			return 2;
			
		case GLPPixelformatRGB565:
			return 2;
		case GLPPixelformatRGB888:
			return 3;
			
		case GLPPixelformatRGBA4444:
			return 2;
		case GLPPixelformatRGBA5551:
			return 2;
		case GLPPixelformatRGBA8888:
			return 4;
		case GLPPixelformatBGRA8888:
			return 4;
			
		case GLPPixelformatPVRRGB2BPP:
			return 0;
		case GLPPixelformatPVRRGB4BPP:
			return 0;
		case GLPPixelformatPVRRGBA2BPP:
			return 0;
		case GLPPixelformatPVRRGBA4BPP:
			return 0;

		default:
			return 0;
	}
}