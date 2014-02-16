#import <Foundation/Foundation.h>


@interface GLPVertexArray : NSObject
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
