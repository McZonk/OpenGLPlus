#import "GLPShader.h"

@interface GLPShader (CompiledShader)

+ (instancetype)compiledShaderWithSource:(NSString *)source type:(GLenum)type error:(NSError **)error;
+ (instancetype)compiledVertexShaderWithSource:(NSString *)source error:(NSError **)error;
+ (instancetype)compiledFragmentShaderWithSource:(NSString *)source error:(NSError **)error;

+ (instancetype)compiledShaderWithContentsOfFile:(NSString *)path type:(GLenum)type error:(NSError **)error;
+ (instancetype)compiledVertexShaderWithContentsOfFile:(NSString *)path error:(NSError **)error;
+ (instancetype)compiledFragmentShaderWithContentsOfFile:(NSString *)path error:(NSError **)error;

+ (instancetype)compiledShaderWithContentsOfURL:(NSURL *)URL type:(GLenum)type error:(NSError **)error;
+ (instancetype)compiledVertexShaderWithContentsOfURL:(NSURL *)URL error:(NSError **)error;
+ (instancetype)compiledFragmentShaderWithContentsOfURL:(NSURL *)URL error:(NSError **)error;

+ (instancetype)compiledShaderWithResource:(NSString *)resource bundle:(NSBundle *)bundle type:(GLenum)type error:(NSError **)error;
+ (instancetype)compiledVertexShaderWithResource:(NSString *)resource bundle:(NSBundle *)bundle error:(NSError **)error;
+ (instancetype)compiledFragmentShaderWithResource:(NSString *)resource bundle:(NSBundle *)bundle error:(NSError **)error;

@end
