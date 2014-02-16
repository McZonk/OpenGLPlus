#import <Foundation/Foundation.h>


@interface GLPShader : NSObject
{
@private
	GLenum type;
	GLuint shader;
}

+ (instancetype)shaderWithType:(GLenum)type;
+ (instancetype)vertexShader;
+ (instancetype)fragmentShader;

- (instancetype)initWithType:(GLenum)type;

@property (assign, nonatomic, readonly) GLenum GLType;
@property (assign, nonatomic, readonly) GLuint GLShader;

- (BOOL)compileSource:(NSString *)source error:(NSError **)error;
- (BOOL)compileContentsOfFile:(NSString *)path error:(NSError **)error;
- (BOOL)compileContentsOfURL:(NSURL *)URL error:(NSError **)error;
- (BOOL)compileResource:(NSString *)resource bundle:(NSBundle *)bundle error:(NSError **)error;

- (NSString *)infoLog;

@end
