#import "GLPProgram+LinkedProgram.h"

#import "GLPShader+CompiledShader.h"


@implementation GLPProgram (LinkedProgram)

+ (instancetype)linkedProgramWithVertexShaderSource:(NSString *)vertexShaderSource fragmentShaderSource:(NSString *)fragmentShaderSource attributes:(NSDictionary *)attributes error:(NSError **)error
{
	GLPShader *vertexShader = [GLPShader compiledVertexShaderWithSource:vertexShaderSource error:error];
	if(vertexShader == nil)
	{
		return nil;
	}
	
	GLPShader *fragmentShader = [GLPShader compiledFragmentShaderWithSource:fragmentShaderSource error:error];
	if(fragmentShader == nil)
	{
		return nil;
	}
	
	return [self linkedProgramWithVertexShader:vertexShader fragmentShader:fragmentShader attributes:attributes error:error];
}

+ (instancetype)linkedProgramWithVertexShaderFile:(NSString *)vertexShaderFile fragmentShaderFile:(NSString *)fragmentShaderFile attributes:(NSDictionary *)attributes error:(NSError **)error
{
	GLPShader* vertexShader = [GLPShader compiledVertexShaderWithContentsOfFile:vertexShaderFile error:error];
	if(vertexShader == nil)
	{
		return nil;
	}
	
	GLPShader* fragmentShader = [GLPShader compiledFragmentShaderWithContentsOfFile:fragmentShaderFile error:error];
	if(fragmentShader == nil)
	{
		return nil;
	}

	return [self linkedProgramWithVertexShader:vertexShader fragmentShader:fragmentShader attributes:attributes error:error];
}

+ (instancetype)linkedProgramWithVertexShaderResource:(NSString *)vertexShaderResource fragementShaderResource:(NSString *)fragmentShaderResource bundle:(NSBundle *)bundle attributes:(NSDictionary *)attributes error:(NSError **)error
{
	GLPShader *vertexShader = [GLPShader compiledVertexShaderWithResource:vertexShaderResource bundle:bundle error:error];
	if(vertexShader == nil)
	{
		return nil;
	}
	
	GLPShader *fragmentShader = [GLPShader compiledFragmentShaderWithResource:fragmentShaderResource bundle:bundle error:error];
	if(fragmentShader == nil)
	{
		return nil;
	}
	
	return [self linkedProgramWithVertexShader:vertexShader fragmentShader:fragmentShader attributes:attributes error:error];
}

+ (instancetype)linkedProgramWithVertexShader:(GLPShader *)vertexShader fragmentShader:(GLPShader *)fragmentShader attributes:(NSDictionary *)attributes error:(NSError **)error
{
	GLPProgram *program = [self program];
	
	if(vertexShader != nil)
	{
		[program attachShader:vertexShader];
	}
	if(fragmentShader != nil)
	{
		[program attachShader:fragmentShader];
	}
	
	[program bindAttributes:attributes];
	
	if(![program link:error])
	{
		return nil;
	}
	
	if(vertexShader != nil)
	{
		[program detachShader:vertexShader];
	}
	if(fragmentShader != nil)
	{
		[program detachShader:fragmentShader];
	}
	
	return program;
}

@end
