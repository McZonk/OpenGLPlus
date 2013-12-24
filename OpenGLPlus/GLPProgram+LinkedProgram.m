#import "GLPProgram+LinkedProgram.h"

#import "GLPShader+CompiledShader.h"


@implementation GLPProgram (LinkedProgram)

+ (instancetype)linkedProgramWithVertexShaderSource:(NSString *)vertexShaderSource fragmentShaderSource:(NSString *)fragmentShaderSource attributes:(NSDictionary *)attributes error:(NSError **)error
{
	GLPProgram *program = [self program];
	
	GLPShader *vertexShader = nil;
	GLPShader *fragmentShader = nil;
	
	if(vertexShaderSource != nil)
	{
		vertexShader = [GLPShader compiledVertexShaderWithSource:vertexShaderSource error:error];
		if(vertexShader == nil)
		{
			return nil;
		}
		[program attachShader:vertexShader];
	}
	
	if(fragmentShaderSource != nil)
	{
		fragmentShader = [GLPShader compiledFragmentShaderWithSource:fragmentShaderSource error:error];
		if(fragmentShader == nil)
		{
			return nil;
		}
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

+ (instancetype)linkedProgramWithVertexShaderFile:(NSString *)vertexShaderFile fragmentShaderFile:(NSString *)fragmentShaderFile attributes:(NSDictionary *)attributes error:(NSError **)error
{
	GLPProgram *program = [self program];
	
	GLPShader* vertexShader = nil;
	GLPShader* fragmentShader = nil;
	
	if(vertexShaderFile != nil)
	{
		vertexShader = [GLPShader compiledVertexShaderWithContentsOfFile:vertexShaderFile error:error];
		if(vertexShader == nil)
		{
			return nil;
		}
		[program attachShader:vertexShader];
	}
	
	if(fragmentShaderFile != nil)
	{
		fragmentShader = [GLPShader compiledFragmentShaderWithContentsOfFile:fragmentShaderFile error:error];
		if(fragmentShader == nil)
		{
			return nil;
		}
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

+ (instancetype)linkedProgramWithVertexShaderResource:(NSString *)vertexShaderResource fragementShaderResource:(NSString *)fragmentShaderResource bundle:(NSBundle *)bundle attributes:(NSDictionary *)attributes error:(NSError **)error
{
	GLPProgram *program = [self program];

	GLPShader* vertexShader = nil;
	GLPShader* fragmentShader = nil;
	
	if(vertexShaderResource != nil)
	{
		vertexShader = [GLPShader compiledVertexShaderWithResource:vertexShaderResource bundle:bundle error:error];
		if(vertexShader == nil)
		{
			return nil;
		}
		[program attachShader:vertexShader];
	}
	
	if(fragmentShaderResource != nil)
	{
		fragmentShader = [GLPShader compiledFragmentShaderWithResource:fragmentShaderResource bundle:bundle error:error];
		if(fragmentShader == nil)
		{
			return nil;
		}
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
