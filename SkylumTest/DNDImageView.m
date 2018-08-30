//
//  DNDImageView.m
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import "DNDImageView.h"

@interface DNDImageView ()
@property (nonatomic, getter=isDragging) BOOL dragging;
@end

@implementation DNDImageView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.wantsLayer = YES;
    self.layer.borderColor = [NSColor lightGrayColor].CGColor;
    self.layer.borderWidth = 2.f;
    [self registerForDraggedTypes:[NSImage imageTypes]];
}

#pragma mark - mark - Drag operations

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender{
    if ([NSImage canInitWithPasteboard:[sender draggingPasteboard]] && [sender draggingSourceOperationMask] & NSDragOperationCopy ) {
        self.dragging = YES;
        self.needsDisplay = YES;
        return NSDragOperationCopy;
    }
    
    return NSDragOperationNone;
}

- (void)setImage:(NSImage *)image{
    [super setImage:image];
    if(self.isDragging){
        self.originalImage = image;
    }
}

- (void)draggingEnded:(id<NSDraggingInfo>)sender{
    self.dragging = NO;
    if(self.delegate){
        [self.delegate didUpdateOriginalImage:self];
    }
}

@end
