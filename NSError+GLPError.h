#import <Foundation/Foundation.h>


extern NSString * const GLPErrorDomain;

extern NSString * const GLPErrorInfoLogKey;
extern NSString * const GLPErrorSourceKey;

typedef enum GLPErrorCode {
	GLPErrorShaderCompilerError = 1000,
	GLPErrorShaderLinkerError,
	GLPErrorInvalidShaderTypeError,
} GLPErrorCode;


@interface NSError (GLPError)


@end
