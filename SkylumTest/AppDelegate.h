//
//  AppDelegate.h
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WindowManager.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property (nonatomic, strong) WindowManager* windowManager;
+ (instancetype)shareInstance;

@end

