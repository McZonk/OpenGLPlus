#import <Foundation/Foundation.h>

#import "GLPObjectLabel.h"


@interface GLPVertexArray : NSObject <GLPObjectLabel>
{
@private
	GLuint vertexArray;
}

+ (instancetype)vertexArray;

- (instancetype)init;

@property (nonatomic, assign) GLuint GLVertexArray;

- (void)bind;
- (void)unbind;

@end
