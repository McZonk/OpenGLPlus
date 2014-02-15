#import "GLPProgram.h"

@class GLPShader;

@interface GLPProgram (LinkedProgram)

+ (instancetype)linkedProgramWithVertexShaderSource:(NSString *)vertexShaderSource fragmentShaderSource:(NSString *)fragmentShaderSource attributes:(NSDictionary *)attributes error:(NSError **)error;

+ (instancetype)linkedProgramWithVertexShaderFile:(NSString *)vertexShaderFile fragmentShaderFile:(NSString *)fragmentShaderFile attributes:(NSDictionary *)attributes error:(NSError **)error;

+ (instancetype)linkedProgramWithVertexShaderResource:(NSString *)vertexShaderResource fragementShaderResource:(NSString *)fragmentShaderResource bundle:(NSBundle *)bundle attributes:(NSDictionary *)attributes error:(NSError **)error;

+ (instancetype)linkedProgramWithVertexShader:(GLPShader *)vertexShader fragmentShader:(GLPShader *)fragmentShader attributes:(NSDictionary *)attributes error:(NSError **)error;

@end
