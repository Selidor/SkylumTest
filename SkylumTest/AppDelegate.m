//
//  AppDelegate.m
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import "AppDelegate.h"
#import "WindowManager.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

+ (instancetype)shareInstance{
    AppDelegate* appDelegate = (AppDelegate*)[NSApp delegate];
    return appDelegate;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self showBrightnessFlow];
}

- (void)showBrightnessFlow{
    NSStoryboard *mainStoryboard = [NSStoryboard storyboardWithName:@"BrightnessFlow" bundle:nil];
    NSWindowController *initialController = [mainStoryboard instantiateInitialController];
    [initialController showWindow:self];
    [initialController.window makeKeyAndOrderFront:self];
    [initialController.window makeMainWindow];
    [self.windowManager addWindow:initialController.window];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)sender hasVisibleWindows:(BOOL)flag{
    [sender.windows.firstObject makeKeyAndOrderFront:self];
    return YES;
}

#pragma mark - Getters

- (WindowManager *)windowManager{
    if(!_windowManager){
        _windowManager = [WindowManager new];
    }
    return _windowManager;
}


@end
