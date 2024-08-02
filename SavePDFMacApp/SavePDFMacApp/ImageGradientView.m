//
//  ImageGradientView.m
//  SavePDFMacApp
//
//  Created by Don Mag MBP on 8/2/24.
//

#import "ImageGradientView.h"
#import "GradientImageCreator.h"

@implementation ImageGradientView

- (void)layout
{
	[super layout];
	NSImage *img = [GradientImageCreator createGradientImageWithSize:self.bounds.size];
	self.image = img;
}
@end
