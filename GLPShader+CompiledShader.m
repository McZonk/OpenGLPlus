#import "GLPShader+CompiledShader.h"

@implementation GLPShader (CompiledShader)

+ (instancetype)compiledShaderWithSource:(NSString *)source type:(GLenum)type error:(NSError **)error
{
	GLPShader *shader = [self shaderWithType:type];
	if(![shader compileSource:source error:error])
	{
		return nil;
	}
	return shader;
}

+ (instancetype)compiledVertexShaderWithSource:(NSString *)source error:(NSError **)error
{
	return [self compiledShaderWithSource:source type:GL_VERTEX_SHADER error:error];
}

+ (instancetype)compiledFragmentShaderWithSource:(NSString *)source error:(NSError **)error
{
	return [self compiledShaderWithSource:source type:GL_FRAGMENT_SHADER error:error];
}

+ (instancetype)compiledShaderWithContentsOfFile:(NSString *)path type:(GLenum)type error:(NSError **)error
{
	GLPShader *shader = [self shaderWithType:type];
	if(![shader compileContentsOfFile:path error:error])
	{
		return nil;
	}
	return shader;
}

+ (instancetype)compiledVertexShaderWithContentsOfFile:(NSString *)path error:(NSError **)error
{
	return [self compiledShaderWithContentsOfFile:path type:GL_VERTEX_SHADER error:error];
}

+ (instancetype)compiledFragmentShaderWithContentsOfFile:(NSString *)path error:(NSError **)error
{
	return [self compiledShaderWithContentsOfFile:path type:GL_FRAGMENT_SHADER error:error];
}

+ (instancetype)compiledShaderWithContentsOfURL:(NSURL *)URL type:(GLenum)type error:(NSError **)error
{
	GLPShader *shader = [self shaderWithType:type];
	if(![shader compileContentsOfURL:URL error:error])
	{
		return nil;
	}
	return shader;
}

+ (instancetype)compiledVertexShaderWithContentsOfURL:(NSURL *)URL error:(NSError **)error
{
	return [self compiledShaderWithContentsOfURL:URL type:GL_VERTEX_SHADER error:error];
}

+ (instancetype)compiledFragmentShaderWithContentsOfURL:(NSURL *)URL error:(NSError **)error
{
	return [self compiledShaderWithContentsOfURL:URL type:GL_FRAGMENT_SHADER error:error];
}

+ (instancetype)compiledShaderWithResource:(NSString *)resource bundle:(NSBundle *)bundle type:(GLenum)type error:(NSError **)error
{
	GLPShader *shader = [GLPShader shaderWithType:type];
	if(![shader compileResource:resource bundle:bundle error:error])
	{
		return nil;
	}
	return shader;
}

+ (instancetype)compiledVertexShaderWithResource:(NSString *)resource bundle:(NSBundle *)bundle error:(NSError **)error
{
	return [self compiledShaderWithResource:resource bundle:bundle type:GL_VERTEX_SHADER error:error];
}

+ (instancetype)compiledFragmentShaderWithResource:(NSString *)resource bundle:(NSBundle *)bundle error:(NSError **)error
{
	return [self compiledShaderWithResource:resource bundle:bundle type:GL_FRAGMENT_SHADER error:error];
}

@end
