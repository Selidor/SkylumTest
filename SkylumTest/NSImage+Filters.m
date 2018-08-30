//
//  NSImage+Filters.m
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import "NSImage+Filters.h"

@implementation NSImage (Filters)

- (NSImage *)imageWithBrightness:(CGFloat)brightness{
    
    if(brightness > 1.f || brightness < -1.f)
        return nil;
    
    NSData* imageData = self.TIFFRepresentation;
    CIImage* ciImage = [CIImage imageWithData:imageData];
    
    ciImage = [ciImage imageByApplyingFilter:@"CIColorControls" withInputParameters:@{@"inputBrightness":@(brightness)}];
    
    NSCIImageRep *imageRep = [NSCIImageRep imageRepWithCIImage:ciImage];
    NSImage *newImage = [[NSImage alloc] initWithSize:[imageRep size]];
    [newImage addRepresentation:imageRep];
    
    return newImage;
}

@end
