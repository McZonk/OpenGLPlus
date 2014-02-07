#import "NSError+GLPShaderCompilerError.h"

#import "NSError+GLPError.h"


@implementation NSError (GLPShaderCompilerError)

- (NSArray *)shaderCompilerErrors
{
	static NSRegularExpression *regex = nil;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSString *pattern = @"^(.+):\\s*(\\d+):\\s*(\\d+):\\s*(\\S.+)$";
		regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionAnchorsMatchLines error:nil];
	});
	
	NSDictionary *userInfo  = self.userInfo;
	
	NSString *infoLog = userInfo[GLPErrorInfoLogKey];
	if(infoLog == nil)
	{
		return nil;
	}
	
	NSString *source = userInfo[GLPErrorSourceKey];
	
	NSMutableArray *errors = [NSMutableArray array];
	
	@try
	{
		[regex enumerateMatchesInString:infoLog options:0 range:NSMakeRange(0, infoLog.length) usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
			
			if(result.numberOfRanges != 5) {
				return;
			}
			
			NSRange typeRange = [result rangeAtIndex:1];
			NSString *type = [infoLog substringWithRange:typeRange];
			
			NSRange fileRange = [result rangeAtIndex:2];
			NSString *file = [infoLog substringWithRange:fileRange];
			
			NSRange lineRange = [result rangeAtIndex:3];
			NSString *line = [infoLog substringWithRange:lineRange];
			
			NSRange textRange = [result rangeAtIndex:4];
			NSString *text = [infoLog substringWithRange:textRange];
			
			NSDictionary *userInfo = @{
				GLPErrorInfoLogKey: infoLog,
				GLPErrorSourceKey: source,
				GLPErrorTypeKey: type,
				GLPErrorFileKey: @(file.integerValue),
				GLPErrorLineKey: @(line.integerValue),
				NSLocalizedDescriptionKey: text,
			};
			
			NSError *error = [NSError errorWithDomain:GLPErrorDomain code:GLPErrorShaderCompilerDetailError userInfo:userInfo];
			
			[errors addObject:error];
		}];
	}
	@catch(...)
	{
	}
	
	return errors;
}

- (NSString *)shaderType
{
	return self.userInfo[GLPErrorTypeKey];
}

- (NSInteger)shaderFile
{
	return ((NSNumber *)self.userInfo[GLPErrorFileKey]).integerValue;
}

- (NSInteger)shaderLine
{
	return ((NSNumber *)self.userInfo[GLPErrorLineKey]).integerValue;
}

@end
