//
//  GLPProgram+TransformFeedback.h
//  OpenGLPlus
//
//  Created by Maximilian Christ on 18/12/13.
//  Copyright (c) 2013 McZonk. All rights reserved.
//

#import "GLPProgram.h"

#if defined(GL_ES_VERSION_3_0) && (GL_ES_VERSION_3_0 > 0)

@interface GLPProgram (TransformFeedback)

- (void)transformFeedbackVaryings:(NSArray *)varyings bufferMode:(GLenum)bufferMode;

@end

#endif
