#include "GLPBase.h"

const GLchar* glpTypeName(const GLenum type) {
	switch(type) {
		case GL_FLOAT :
			return "float";
		case GL_FLOAT_VEC2 :
			return "float[2]";
		case GL_FLOAT_VEC3 :
			return "float[3]";
		case GL_FLOAT_VEC4 :
			return "float[4]";
		
		case GL_INT :
			return "int";
		case GL_INT_VEC2 :
			return "int[2]";
		case GL_INT_VEC3 :
			return "int[3]";
		case GL_INT_VEC4 :
			return "int[4]";
		
		case GL_BOOL :
			return "bool";
		case GL_BOOL_VEC2 :
			return "bool[2]";
		case GL_BOOL_VEC3 :
			return "bool[3]";
		case GL_BOOL_VEC4 :
			return "bool[4]";
		
		case GL_FLOAT_MAT2 :
			return "float[2][2]";
		case GL_FLOAT_MAT3 :
			return "float[3][3]";
		case GL_FLOAT_MAT4 :
			return "float[4][4]";
		
		case GL_SAMPLER_2D :
			return "texture2D";
		case GL_SAMPLER_CUBE :
			return "textureCube";
			
#if defined(GL_ES_VERSION_3_0) && (GL_ES_VERSION_3_0 > 0)
		case GL_SAMPLER_2D_SHADOW:
			return "texture2Dshadow";
		case GL_SAMPLER_3D:
			return "texture3D";
#endif
		
		default :
			return NULL;
	}
}
