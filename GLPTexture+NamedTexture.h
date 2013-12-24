//
//  GLPTexture+NamedTexture.h
//  OpenGLPlus
//
//  Created by Maximilian Christ on 24/12/13.
//  Copyright (c) 2013 McZonk. All rights reserved.
//

#import "GLPTexture.h"

@interface GLPTexture (NamedTexture)

+ (instancetype)textureNamed:(NSString *)name;
+ (instancetype)textureNamed:(NSString *)name bundle:(NSBundle *)bundle;

@end
