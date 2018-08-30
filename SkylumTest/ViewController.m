//
//  ViewController.m
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import "ViewController.h"
#import "DNDImageView.h"
#import "NSImage+Filters.h"

@interface ViewController ()<DNDImageViewDelegate>

@property (weak) IBOutlet NSSlider *brightnessSlider;
@property (weak) IBOutlet DNDImageView *imageView;
@property (weak) IBOutlet NSTextField *placeholder;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.brightnessSlider.doubleValue = 0.f;
    self.brightnessSlider.enabled = NO;
    self.imageView.delegate = self;
    self.placeholder.hidden = NO;
}

#pragma mark - Actions

- (IBAction)brightnessSliderDidChangeValue:(NSSlider*)slider {
    if(!self.imageView.image)
        return;
    
    [self applyBrightnss:slider.doubleValue];
}

- (void)applyBrightnss:(CGFloat)brightnss{
    double brightnesValue = (brightnss/100.f);
    self.imageView.image = [self.imageView.originalImage imageWithBrightness:brightnesValue];
}

#pragma mark - DND image View Delegate

- (void)didUpdateOriginalImage:(DNDImageView *)dndImageView{
    if(dndImageView.originalImage){
        self.brightnessSlider.enabled = YES;
        self.placeholder.hidden = YES;
        [self applyBrightnss:self.brightnessSlider.doubleValue];
    }else{
        self.brightnessSlider.enabled = NO;
        self.placeholder.hidden = NO;
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}


@end
