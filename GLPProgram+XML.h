#import "GLPProgram.h"

/*
 * <?xml version="1.0"?>
 * <program>
 * <shader type="vertex"><![CDATA[
 *   // code;
 * ]]></shader>
 * <shader type="fragment"><![CDATA[
 *   // code;
 * ]]></shader>
 * <attribute name="position" location="0"/>
 * <attribute name="texcoord" location="1"/>
 * <uniform name="matrix" type="mat4" value="IDENTITY"/>
 * <uniform name="texture" type="int" value="0"/>
 * </program>
 */

@interface GLPProgram (XML)

+ (instancetype)linkedProgramWithXMLFile:(NSString *)path error:(NSError **)error;

+ (instancetype)linkedProgramWithXMLResource:(NSString *)resource bundle:(NSBundle *)bundle error:(NSError **)error;

@end
