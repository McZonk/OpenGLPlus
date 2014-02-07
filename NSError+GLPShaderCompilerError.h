#import <Foundation/Foundation.h>

@interface NSError (GLPShaderCompilerError)

- (NSArray *)shaderCompilerErrors;

- (NSString *)shaderType;
- (NSInteger)shaderFile;
- (NSInteger)shaderLine;

@end
