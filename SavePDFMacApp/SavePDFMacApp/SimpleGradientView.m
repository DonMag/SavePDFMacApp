//
//  SimpleGradientView.m
//  SavePDFMacApp
//
//  Created by Don Mag on 8/2/24.
//

#import "SimpleGradientView.h"

@implementation SimpleGradientView

- (void)drawRect:(NSRect)dirtyRect {
	[super drawRect:dirtyRect];
	NSGradient *bg = [[NSGradient alloc] initWithColors:@[NSColor.redColor, NSColor.yellowColor]];
	[bg drawInRect:self.bounds angle:90.0];
}

@end
