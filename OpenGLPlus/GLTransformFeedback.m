//
//  GLTransformFeedback.m
//  OpenGLPlus
//
//  Created by Maximilian Christ on 18/12/13.
//  Copyright (c) 2013 McZonk. All rights reserved.
//

#import "GLTransformFeedback.h"

#if defined(GL_ES_VERSION_3_0) && (GL_ES_VERSION_3_0 > 0)

@implementation GLTransformFeedback

+ (instancetype)transformFeedback
{
	return [[self alloc] init];
}

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
		target = GL_TRANSFORM_FEEDBACK;
		
		glGenTransformFeedbacks(1, &transformFeedback);
		if(transformFeedback == 0)
		{
			return nil;
		}
	}
	return self;
}

- (void)dealloc
{
	if(transformFeedback != 0)
	{
		glDeleteTransformFeedbacks(1, &transformFeedback);
	}
}

@synthesize GLTarget = target;
@synthesize GLTransformFeedback = transformFeedback;

- (void)bind
{
	glBindTransformFeedback(target, transformFeedback);
}

- (void)unbind
{
	glBindTransformFeedback(target, 0);
}

- (void)beginWithPrimitiveMode:(GLenum)primitiveMode
{
	glBeginTransformFeedback(primitiveMode);
}

- (void)end
{
	glEndTransformFeedback();
}

- (void)pause
{
	glPauseTransformFeedback();
}

- (void)resume
{
	glResumeTransformFeedback();
}

@end

#endif /* GL_ES_VERSION_3_0 */

