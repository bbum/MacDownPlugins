//
//  JekyllNewPost.m
//  JekyllNewPost
//
//  Created by William Bumgarner on 10/13/18.
//  Copyright © 2018 Bill Bumgarner. All rights reserved.
//

#import "JekyllNewPost.h"

#import <os/log.h>

os_log_t JNPLog(void)
{
    static os_log_t _JNPLog;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _JNPLog = os_log_create("com.friday.macdown", "JekyllNewPost");
    });
    return _JNPLog;
}

@implementation JekyllNewPost
// Note that there is one instance of the bundle's principal class created *every single time* you click the Plugins menu in MacDown.
// However, the `-plugInDidInitialize` method will be invoked only once.
// To preserve states across invocations?  Global varaibles or singleton (evil -init dance, anyone?) FTW!

- (void)plugInDidInitialize
{
    os_log_info(JNPLog(), "%s initializing %@", __PRETTY_FUNCTION__, [self name]);
}

- (NSString *)name
{
    return @"New Jekyll Post";
}

- (BOOL)run:sender
{
    os_log_info(JNPLog(), "%s invoking %@", __PRETTY_FUNCTION__, [self name]);
    return YES;
}
@end
