#import "EAGLContext+GLPBestRenderingAPI.h"

@implementation EAGLContext (GLPBestRenderingAPI)

+ (instancetype)contextWithBestRenderingAPI
{
	return [self contextWithBestRenderingAPISharegroup:nil];
}

+ (instancetype)contextWithBestRenderingAPISharegroup:(EAGLSharegroup *)sharegroup
{
	const EAGLRenderingAPI APIs[] = {
		kEAGLRenderingAPIOpenGLES3,
		kEAGLRenderingAPIOpenGLES2,
		kEAGLRenderingAPIOpenGLES1,
	};
	
	for(NSInteger index = 0; index < sizeof(APIs) / sizeof(*APIs); ++index)
	{
		EAGLRenderingAPI API = APIs[index];
		EAGLContext *context = [[EAGLContext alloc] initWithAPI:API sharegroup:sharegroup];
		if(context != nil)
		{
			return context;
		}
	}
	
	return nil;
}

@end
