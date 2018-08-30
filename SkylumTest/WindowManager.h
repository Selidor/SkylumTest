//
//  WindowManager.h
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface WindowManager : NSObject
@property (nonatomic, readonly) NSSet<NSWindow*>* windows;

- (void)addWindow:(NSWindow*)window;
- (void)removeWindow:(NSWindow*)window;
- (void)clearAll;

@end
