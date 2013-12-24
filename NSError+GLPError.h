#import <Foundation/Foundation.h>


extern NSString * const GLPErrorDomain;

typedef enum GLPErrorCode {
	GLPErrorShaderCompilerError = 1000,
	GLPErrorShaderLinkerError,
	GLPErrorInvalidShaderTypeError,
} GLPErrorCode;

@interface NSError (GLPError)



@end
