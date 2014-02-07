#import <Foundation/Foundation.h>


extern NSString * const GLPErrorDomain;

extern NSString * const GLPErrorInfoLogKey;
extern NSString * const GLPErrorSourceKey;

extern NSString * const GLPErrorTypeKey;
extern NSString * const GLPErrorFileKey;
extern NSString * const GLPErrorLineKey;


typedef enum GLPErrorCode {
	GLPErrorShaderCompilerError = 1000,
	GLPErrorProgramLinkerError,

	GLPErrorShaderCompilerDetailError,
	GLPErrorProgramLinkerDetailError,
	
	GLPErrorInvalidShaderTypeError,
} GLPErrorCode;


@interface NSError (GLPError)


@end
