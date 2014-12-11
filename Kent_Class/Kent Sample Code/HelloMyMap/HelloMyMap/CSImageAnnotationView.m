

#import "CSImageAnnotationView.h"

@implementation CSImageAnnotationView

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
	
	UIImage *iconImage = [UIImage imageNamed:@"home.png"];

	self.frame = CGRectMake(0, 0, iconImage.size.width, iconImage.size.height);
	self.backgroundColor = [UIColor clearColor];	
	
	UIImageView* iconImageView;		
	
	iconImageView = [[UIImageView alloc] initWithImage:iconImage];

	[self addSubview:iconImageView];
	
	return self;
	
}


	 
@end
