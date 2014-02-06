#import "GLPShader.h"

#import "GLPShaderBase.h"


@implementation GLPShader

+ (instancetype)shaderWithType:(GLenum)type
{
	return [[self alloc] initWithType:type];
}

+ (instancetype)vertexShader
{
	return [self shaderWithType:GL_VERTEX_SHADER];
}

+ (instancetype)fragmentShader
{
	return [self shaderWithType:GL_FRAGMENT_SHADER];
}

+ (instancetype)init
{
	return nil;
}

- (instancetype)initWithType:(GLenum)type_
{
	self = [super init];
	if(self != nil)
	{
		type = type_;
		shader = glCreateShader(type_);
		if(shader == 0)
		{
			return nil;
		}
	}
	return self;
}

- (void)dealloc
{
	if(shader != 0)
	{
		glDeleteShader(shader);
	}
}

@synthesize GLType = type;
@synthesize GLShader = shader;

- (BOOL)compileSource:(NSString *)source error:(NSError **)error
{
	if(source.length == 0)
	{
		NSLog(@"Error empty source");
		return NO;
	}
	
	BOOL compiled = glpShaderCompileSource(shader, source.UTF8String);
	if(!compiled)
	{
		NSString* infoLog = self.infoLog;
		
		if(error != nil)
		{
			NSDictionary *userInfo = @{
				GLPErrorSourceKey : source,
				GLPErrorInfoLogKey : infoLog,
			};
			*error = [NSError errorWithDomain:GLPErrorDomain code:GLPErrorShaderCompilerError userInfo:userInfo];
		}
		else
		{
			NSLog(@"%s:%d:error: %@", __FUNCTION__, __LINE__, infoLog);
		}
		return NO;
	}
	
	return YES;
}

- (BOOL)compileContentsOfFile:(NSString *)path error:(NSError **)outError
{
	NSError *error = nil;
	NSString *source = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
	if(source == nil)
	{
		if(outError != nil)
		{
			*outError = error;
		}
		else
		{
			NSLog(@"%s:%d:error: %@", __FUNCTION__, __LINE__, error);
		}
		return NO;
	}
	
	return [self compileSource:source error:outError];
}

- (BOOL)compileContentsOfURL:(NSURL *)URL error:(NSError **)outError
{
	NSError *error = nil;
	NSString *source = [[NSString alloc] initWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:&error];
	if(source == nil)
	{
		if(outError != nil)
		{
			*outError = error;
		}
		else
		{
			NSLog(@"%s:%d:error: %@", __FUNCTION__, __LINE__, error);
		}
		
		return NO;
	}
	
	return [self compileSource:source error:outError];
}

- (BOOL)compileResource:(NSString *)resource bundle:(NSBundle *)bundle error:(NSError **)error
{
	if(bundle == nil)
	{
		bundle = NSBundle.mainBundle;
	}
	
	NSURL *URL = [bundle URLForResource:resource withExtension:nil];
	if(URL == nil)
	{
		// try to find a matching URL by adding an extension
		
		NSArray *extensions = nil;
		if(type == GL_VERTEX_SHADER)
		{
			extensions = @[ @"vsh", @"vs" ];
		}
		else if(type == GL_FRAGMENT_SHADER)
		{
			extensions = @[ @"fsh", @"fs" ];
		}
		
		for(NSString *extension in extensions)
		{
			URL = [bundle URLForResource:resource withExtension:extension];
			if(URL != nil)
			{
				break;
			}
		}
	}
	
	return [self compileContentsOfURL:URL error:error];
}

- (BOOL)compiled
{
	return glpShaderGetCompileStatus(shader);
}

- (NSString*)infoLog
{
	char *infoLog = glpShaderCopyInfoLog(shader);
	
	NSString *string = [[NSString alloc] initWithCString:infoLog encoding:NSUTF8StringEncoding];
	
	free(infoLog), infoLog = 0;
	
	return string;
}

#pragma mark - GLPObjectLabel
#if defined(GL_EXT_debug_label) && (GL_EXT_debug_label != 0)
- (NSString *)objectLabel
{
	return GLPGetObjectLabelString(GL_SHADER_OBJECT_EXT, shader);
}

- (void)setObjectLabel:(NSString *)objectLabel
{
	GLPSetObjectLabelString(GL_SHADER_OBJECT_EXT, shader, objectLabel);
}
#endif

@end
