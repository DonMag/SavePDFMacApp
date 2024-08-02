//
//  GradientImageCreator.h
//  SavePDFMacApp
//
//  Created by Don Mag MBP on 8/2/24.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradientImageCreator : NSObject
+ (NSImage *)createGradientImageWithSize:(NSSize)size;
@end

NS_ASSUME_NONNULL_END
