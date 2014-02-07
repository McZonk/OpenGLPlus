#import "NSError+GLPProgramLinkerError.h"

#import "NSError+GLPError.h"


@implementation NSError (GLPProgramLinkerError)

- (NSArray *)programLinkerErrors
{
	static NSRegularExpression *regex = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSString *pattern = @"^(.+):\\s*\\s*(\\w.+)$";
		regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:nil];
	});
	
	NSDictionary *userInfo  = self.userInfo;
	
	NSString *infoLog = userInfo[GLPErrorInfoLogKey];
	if(infoLog == nil)
	{
		return nil;
	}
	
	NSMutableArray *errors = [NSMutableArray array];
	
	@try
	{
		[regex enumerateMatchesInString:infoLog options:0 range:NSMakeRange(0, infoLog.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
			
			if(result.numberOfRanges != 3) {
				return;
			}
			
			NSRange typeRange = [result rangeAtIndex:1];
			NSString *type = [infoLog substringWithRange:typeRange];
			
			NSRange textRange = [result rangeAtIndex:2];
			NSString *text = [infoLog substringWithRange:textRange];
			
			NSDictionary *userInfo = @{
				GLPErrorInfoLogKey: infoLog,
				GLPErrorFileKey: @0,
				GLPErrorLineKey: @1,
				GLPErrorTypeKey: type,
				NSLocalizedDescriptionKey: text,
			};
			
			NSError *error = [NSError errorWithDomain:GLPErrorDomain code:GLPErrorProgramLinkerDetailError userInfo:userInfo];
			
			[errors addObject:error];
		}];
	}
	@catch(...)
	{
	}
	
	return errors;
}

@end
