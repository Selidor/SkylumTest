//
//  DNDImageView.h
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DNDImageView;

@protocol DNDImageViewDelegate <NSObject>

@required

- (void)didUpdateOriginalImage:(DNDImageView*)dndImageView;

@end

@interface DNDImageView : NSImageView <NSDraggingDestination>
@property (nonatomic, strong) NSImage* originalImage;
@property (nonatomic, weak) id<DNDImageViewDelegate> delegate;

@end
