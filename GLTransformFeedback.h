//
//  GLTransformFeedback.h
//  OpenGLPlus
//
//  Created by Maximilian Christ on 18/12/13.
//  Copyright (c) 2013 McZonk. All rights reserved.
//

#import <Foundation/Foundation.h>

#if defined(GL_ES_VERSION_3_0) && (GL_ES_VERSION_3_0 > 0)

@interface GLTransformFeedback : NSObject
{
@protected
	GLenum target;
	GLuint transformFeedback;
}

+ (instancetype)transformFeedback;

@property (nonatomic, assign, readonly) GLenum GLTarget;
@property (nonatomic, assign, readonly) GLuint GLTransformFeedback;

- (void)bind;
- (void)unbind;

- (void)beginWithPrimitiveMode:(GLenum)primitiveMode;
- (void)end;

- (void)pause;
- (void)resume;

@end

#endif /* GL_ES_VERSION_3_0 */
