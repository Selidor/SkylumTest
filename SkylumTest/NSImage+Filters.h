//
//  NSImage+Filters.h
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (Filters)

- (NSImage*)imageWithBrightness:(CGFloat)brightness;

@end
