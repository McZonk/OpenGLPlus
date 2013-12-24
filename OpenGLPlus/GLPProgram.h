#import <Foundation/Foundation.h>


@class GLPShader;


@interface GLPProgram : NSObject
{
@private
	GLuint program;
}

+ (instancetype)program;

- (instancetype)init;

@property (nonatomic, assign, readonly) GLuint GLProgram;

- (void)attachShader:(GLPShader *)shader;
- (void)attachGLShader:(GLuint)shader;

- (void)detachShader:(GLPShader *)shader;
- (void)detachGLShader:(GLuint)shader;

- (BOOL)link:(NSError **)error;

- (BOOL)linked;
- (NSString *)infoLog;

- (GLint)attributeLocation:(NSString *)name;
- (GLint)uniformLocation:(NSString *)name;

- (void)bindAttribute:(NSString *)name toLocation:(GLint)location;
- (void)bindAttributes:(NSDictionary *)attributes;

- (void)use;

@end
