//
//  GradientImageCreator.m
//  SavePDFMacApp
//
//  Created by Don Mag MBP on 8/2/24.
//

#import "GradientImageCreator.h"

@implementation GradientImageCreator

+ (NSImage *)createGradientImageWithSize:(NSSize)size {
	// Create a new NSImage with the specified size
	NSImage *image = [[NSImage alloc] initWithSize:size];
	
	// Lock focus on the image to draw
	[image lockFocus];
	
	// Get the current graphics context
	CGContextRef context = [[NSGraphicsContext currentContext] CGContext];
	
	// Define the gradient colors
	NSColor *startColor = [NSColor redColor];
	NSColor *endColor = [NSColor yellowColor];
	
	// Create a CGGradient with the colors
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	NSArray *colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
	CGFloat locations[] = {0.0, 1.0};
	CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
	
	// Draw the gradient
	CGPoint startPoint = CGPointMake(0, 0);
	CGPoint endPoint = CGPointMake(0.0, size.height);
	CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
	
	// Release the gradient and color space
	CGGradientRelease(gradient);
	CGColorSpaceRelease(colorSpace);
	
	// Unlock focus
	[image unlockFocus];
	
	return image;
}

@end
