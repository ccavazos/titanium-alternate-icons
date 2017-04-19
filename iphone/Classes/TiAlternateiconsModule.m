/**
 * titanium-alternate-icons
 *
 * Created by Your Name
 * Copyright (c) 2017 Your Company. All rights reserved.
 */

#import "TiAlternateiconsModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

@implementation TiAlternateiconsModule

#pragma mark Internal

// this is generated for your module, please do not change it
- (id)moduleGUID
{
	return @"1730e6ec-327b-4f48-8705-461178f9db12";
}

// this is generated for your module, please do not change it
- (NSString *)moduleId
{
	return @"ti.alternateicons";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[DEBUG] %@ loaded",self);
}

#pragma Public APIs

- (NSNumber *)isSupported:(id)unused
{
#ifdef __IPHONE_10_3
    return NUMBOOL([[[UIDevice currentDevice] systemVersion] compare:@"10.3" options:NSNumericSearch] != NSOrderedAscending);
#else
    return NUMBOOL(NO);
#endif
}

- (NSNumber *)supportsAlternateIcons:(id)unused
{
    ENSURE_ARG_COUNT(unused, 0);
#ifdef __IPHONE_10_3
    return NUMBOOL([[UIApplication sharedApplication] supportsAlternateIcons]);
#else
    NSLog(@"[ERROR] Ti.AlternateIcons: This feature is only available on iOS 10.3 and later.");
#endif
}

- (NSString *)alternateIconName:(id)unused
{
#ifdef __IPHONE_10_3
    return [[UIApplication sharedApplication] alternateIconName];
#else
    NSLog(@"[ERROR] Ti.AlternateIcons: This feature is only available on iOS 10.3 and later.");
#endif
}

- (void)setAlternateIconName:(id)args
{
    NSString *iconName;
    KrollCallback *callback;

    ENSURE_ARG_OR_NIL_AT_INDEX(iconName, args, 0, NSString);
    
    if ([args count] == 2) {
        ENSURE_ARG_AT_INDEX(callback, args, 1, KrollCallback);
    }
    
#ifdef __IPHONE_10_3
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (callback == nil) {
            return;
        }
        
        NSMutableDictionary *event = [NSMutableDictionary dictionaryWithDictionary:@{@"success": NUMBOOL(error == nil)}];
        
        if (error) {
            [event setObject:[error localizedDescription] forKey:@"error"];
        }
        
        NSArray *invocationArray = [NSArray arrayWithObjects:&event count:1];
        [callback call:invocationArray thisObject:self];
    }];
#else
    if (callback != nil) {
        NSDictionary *event = @{@"success": NUMBOOL(NO), @"error": @"This feature is only available on iOS 10.3 and later."};
        
        NSArray *invocationArray = [NSArray arrayWithObjects:&event count:1];
        [callback call:invocationArray thisObject:self];
    } else {
        NSLog(@"[ERROR] Ti.AlternateIcons: This feature is only available on iOS 10.3 and later.");
    }
#endif
}

- (void)setDefaultIconName:(id)args
{
    [self setAlternateIconName:@[[NSNull null], [args count] == 1 ? [args objectAtIndex:0] : [NSNull null]]];
}

@end
