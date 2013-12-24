//
//  GLPProgram+TransformFeedback.m
//  OpenGLPlus
//
//  Created by Maximilian Christ on 18/12/13.
//  Copyright (c) 2013 McZonk. All rights reserved.
//

#import "GLPProgram+TransformFeedback.h"

@implementation GLPProgram (TransformFeedback)

- (void)transformFeedbackVaryings:(NSArray *)varyings bufferMode:(GLenum)bufferMode
{
	GLsizei count = (GLsizei)varyings.count;
	
	const GLchar **data = malloc(sizeof(GLchar *) * count);
	
	GLsizei index = 0;
	for(NSString *varying in varyings)
	{
		data[index] = varying.UTF8String;
		++index;
	}
	
	glTransformFeedbackVaryings(program, count, data, bufferMode);
	
	free(data);
}

@end
