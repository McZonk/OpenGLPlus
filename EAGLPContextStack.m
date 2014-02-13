#import "EAGLPContextStack.h"

@interface EAGLPContextStack ()

@property (nonatomic, strong) NSMutableArray *contextStack;

@end


@implementation EAGLPContextStack

- (instancetype)init
{
	self = [super init];
	if(self != nil)
	{
		self.contextStack = [[NSMutableArray alloc] initWithCapacity:4];
	}
	return self;
}

- (BOOL)pushCurrentContext:(EAGLContext *)newContext
{
	EAGLContext *context = EAGLContext.currentContext;
	if(context == nil)
	{
		context = (EAGLContext *)NSNull.null;
	}
	
	BOOL success = [EAGLContext setCurrentContext:newContext];
	if(!success)
	{
		return NO;
	}
	
	[self.contextStack addObject:context];
	
	return YES;
}

- (void)popCurrentContext
{
	EAGLContext *context = self.contextStack.lastObject;
	if(context == nil)
	{
		return;
	}
	
	[self.contextStack removeLastObject];
	
	if(context == (EAGLContext *)NSNull.null)
	{
		context = nil;
	}
	
	[EAGLContext setCurrentContext:context];
}

@end
