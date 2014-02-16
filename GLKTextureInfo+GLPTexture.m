#import "GLKTextureInfo+GLPTexture.h"

#import "GLPTextureBase.h"


@implementation GLKTextureInfo (GLKTexture)

- (GLenum)GLTarget
{
	return self.target;
}

- (GLuint)GLTexture
{
	return self.name;
}

- (void)bind
{
	glBindTexture(self.target, self.name);
}

- (void)bindToUnit:(GLenum)unit
{
	glpActiveTexture(unit);
	[self bind];
}

- (void)unbind
{
	glBindTexture(self.target, 0);
}

@end
