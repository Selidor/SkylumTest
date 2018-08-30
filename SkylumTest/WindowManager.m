//
//  WindowManager.m
//  SkylumTest
//
//  Created by Artem Shvets on 30.08.2018.
//  Copyright © 2018 Artem Shvets. All rights reserved.
//

#import "WindowManager.h"

@interface WindowManager()
@property (nonatomic, strong) NSSet<NSWindow*>* windows;
@end

@implementation WindowManager

- (instancetype)init{
    self = [super init];
    if(self){
        _windows = [NSMutableSet new];
    }
    
    return self;
}

- (void)addWindow:(NSWindow *)window{
    NSMutableSet* mSet = [self.windows mutableCopy];
    if (window) {
        [mSet addObject:window];
        self.windows = [mSet copy];
    }
}

- (void)removeWindow:(NSWindow *)window{
    NSMutableSet* mSet = [self.windows mutableCopy];
    if (window && [self.windows containsObject:window]) {
        [mSet removeObject:window];
        self.windows = [mSet copy];
    }
}

- (void)clearAll{
    self.windows = nil;
}

@end
