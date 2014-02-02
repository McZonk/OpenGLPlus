#import "EAGLContext+GLPContextStack.h"

#import <Foundation/NSArray.h>
#import <Foundation/NSNull.h>

@implementation EAGLContext (GLPContextStack)

static dispatch_once_t contextStackOnceToken = 0;
static NSMutableArray *contextStack = nil;

+ (BOOL)pushCurrentContext:(EAGLContext *)newContext
{
	dispatch_once(&contextStackOnceToken, ^{
		contextStack = [[NSMutableArray alloc] init];
	});
	
	EAGLContext *context = self.currentContext;
	if(context == nil)
	{
		context = (EAGLContext *)NSNull.null;
	}
	
	BOOL success = (self.currentContext = newContext);
	if(!success)
	{
		return NO;
	}
	
	[contextStack addObject:context];
	
	return YES;
}

+ (void)popCurrentContext
{
	dispatch_once(&contextStackOnceToken, ^{
		contextStack = [[NSMutableArray alloc] init];
	});
	
	EAGLContext *context = contextStack.lastObject;
	if(context == nil)
	{
		return;
	}
	
	[contextStack removeLastObject];
	
	if(context == (EAGLContext *)NSNull.null)
	{
		context = nil;
	}
	
	self.currentContext = context;
}

@end
