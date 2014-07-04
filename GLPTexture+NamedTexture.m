//
//  GLPTexture+NamedTexture.m
//  OpenGLPlus
//
//  Created by Maximilian Christ on 24/12/13.
//  Copyright (c) 2013 McZonk. All rights reserved.
//

#import "GLPTexture+NamedTexture.h"

#if defined(TARGET_OS_IPHONE) && (TARGET_OS_IPHONE > 0)
#import "GLPTexture+UIImage.h"
#endif


@implementation GLPTexture (NamedTexture)

+ (instancetype)textureNamed:(NSString *)name
{
#if defined(TARGET_OS_IPHONE) && (TARGET_OS_IPHONE > 0)
	UIImage *image = [UIImage imageNamed:name];
	if(image != nil)
	{
		return [self textureWithUIImage:image];
	}
#endif
	
	return [self textureNamed:name bundle:nil];
}

+ (instancetype)textureNamed:(NSString *)name bundle:(NSBundle *)bundle
{
	if(bundle == nil)
	{
		bundle = NSBundle.mainBundle;
	}
	
	NSString *path = [bundle pathForResource:name ofType:nil];
	if(path == nil)
	{
		return nil;
	}
	
#if defined(TARGET_OS_IPHONE) && (TARGET_OS_IPHONE > 0)
	UIImage *image = [UIImage imageWithContentsOfFile:path];
	return [self textureWithUIImage:image];
#else
	return nil;
#endif
}

@end
