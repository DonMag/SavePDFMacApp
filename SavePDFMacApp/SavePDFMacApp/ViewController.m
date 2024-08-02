//
//  ViewController.m
//  SavePDFMacApp
//
//  Created by Don Mag on 8/2/24.
//

#import "ViewController.h"

#import "SimpleGradientView.h"

#import "ImageGradientView.h"

#define USEIMAGE

@interface ViewController ()
{
#ifdef USEIMAGE
	ImageGradientView *gradView;
#else
	SimpleGradientView *gradView;
#endif
}

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.preferredContentSize = NSMakeSize(600.0, 480.0);

#ifdef USEIMAGE
	gradView = [ImageGradientView new];
#else
	gradView = [SimpleGradientView new];
#endif
	
	// Create a button
	NSButton *button = [[NSButton alloc] initWithFrame:NSMakeRect(150, 125, 100, 50)];
	[button setTitle:@"Save as PDF"];
	[button setButtonType:NSButtonTypeMomentaryPushIn];
	[button setBezelStyle:NSBezelStyleRounded];
	[button setTarget:self];
	[button setAction:@selector(saveAsPDF:)];
	
	// Create a label
	NSTextField *label = [[NSTextField alloc] initWithFrame:NSMakeRect(40, 20, 200, 45)];
	
#ifdef USEIMAGE
	[label setStringValue:@"Hello, Image!"];
#else
	[label setStringValue:@"Hello, PDF!"];
#endif
	
	[label setBezeled:NO];
	[label setDrawsBackground:NO];
	[label setEditable:NO];
	[label setSelectable:NO];
	
	NSFontManager *fontManager = [NSFontManager sharedFontManager];
	NSFont *boldItalic = [fontManager fontWithFamily:@"Verdana"
											  traits:NSBoldFontMask|NSItalicFontMask
											  weight:0 size:48];
	
	// create an image view with image
	NSImage *img = [NSImage imageWithSystemSymbolName:@"apple.logo" accessibilityDescription:@""];
	NSImageView *iv = [NSImageView new];
	iv.image = img;
	iv.imageScaling = NSImageScaleProportionallyUpOrDown;
	iv.contentTintColor = NSColor.cyanColor;
	
	[label setFont:boldItalic];
	[label setTextColor:NSColor.blueColor];
	
	button.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:button];
	
	gradView.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:gradView];
	
	label.translatesAutoresizingMaskIntoConstraints = NO;
	[gradView addSubview:label];
	
	iv.translatesAutoresizingMaskIntoConstraints = NO;
	[gradView addSubview:iv];
	
	[NSLayoutConstraint activateConstraints:@[
		
		[button.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:20.0],
		[button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
		
		[gradView.topAnchor constraintEqualToAnchor:button.bottomAnchor constant:20.0],
		[gradView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:40.0],
		[gradView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-40.0],
		[gradView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-40.0],
		
		[label.topAnchor constraintEqualToAnchor:gradView.topAnchor constant:20.0],
		[label.centerXAnchor constraintEqualToAnchor:gradView.centerXAnchor],
		
		[iv.topAnchor constraintEqualToAnchor:label.bottomAnchor constant:20.0],
		[iv.centerXAnchor constraintEqualToAnchor:gradView.centerXAnchor],
		[iv.bottomAnchor constraintEqualToAnchor:gradView.bottomAnchor constant:-20.0],
		[iv.widthAnchor constraintEqualToAnchor:iv.heightAnchor],
		
	]];
	
}

- (void)saveAsPDF:(id)sender {
	NSData *pdfData = [gradView dataWithPDFInsideRect:[gradView bounds]];
	NSSavePanel *savePanel = [NSSavePanel savePanel];
	[savePanel setAllowedFileTypes:@[@"pdf"]];
	[savePanel setNameFieldStringValue:@"MyView.pdf"];
	
	[savePanel beginWithCompletionHandler:^(NSModalResponse result) {
		if (result == NSModalResponseOK) {
			NSURL *fileURL = [savePanel URL];
			[pdfData writeToURL:fileURL atomically:YES];
			NSLog(@"PDF saved to %@", fileURL);
		}
	}];
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];
}

@end
