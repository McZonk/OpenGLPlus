#import "GLPProgram.h"


@interface GLPProgramAttribute : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, assign, readonly) GLint index;
@property (nonatomic, assign, readonly) GLenum type;
@property (nonatomic, assign, readonly) GLint count;
@property (nonatomic, assign, readonly) GLint location;

@end

@interface GLPProgramUniform : NSObject

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, assign, readonly) GLint index;
@property (nonatomic, assign, readonly) GLenum type;
@property (nonatomic, assign, readonly) GLint count;
@property (nonatomic, assign, readonly) GLint location;

@end

/*
 * All these methods are slow!
 * Only use for debugging
 */

@interface GLPProgram (DebugInformation)

- (GLint)attributeCount;
- (GLint)uniformCount;

- (NSArray *)attributes;
- (NSArray *)uniforms;

@end
