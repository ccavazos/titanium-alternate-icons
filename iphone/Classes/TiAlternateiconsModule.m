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
-(id)moduleGUID
{
	return @"1730e6ec-327b-4f48-8705-461178f9db12";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
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

-(NSNumber*)isSupported:(id)unused
{
#ifdef __IPHONE_10_3
    return NUMBOOL([[[UIDevice currentDevice] systemVersion] compare:@"10.3" options:NSNumericSearch] != NSOrderedAscending);
#else
    return NUMBOOL(NO);
#endif
}

-(NSNumber*)supportsAlternateIcons:(id)unused
{
    ENSURE_ARG_COUNT(unused, 0);
#ifdef __IPHONE_10_3
    return NUMBOOL([[UIApplication sharedApplication] supportsAlternateIcons]);
#else
    NSLog(@"[ERROR] Ti.AlternateIcons: This feature is only available on iOS 10.3 and later.");
#endif
}

-(NSString*)alternateIconName:(id)unused
{
#ifdef __IPHONE_10_3
    return [[UIApplication sharedApplication] alternateIconName];
#else
    NSLog(@"[ERROR] Ti.AlternateIcons: This feature is only available on iOS 10.3 and later.");
#endif
}
-(void)setAlternateIconName:(NSString*)iconName
{
    ENSURE_STRING_OR_NIL(iconName)
#ifdef __IPHONE_10_3
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"[ERROR] Ti.AlternateIcons: %@", [error localizedDescription]);
        } else {
            // TODO: Pass optional callback as second parameter
            NSLog(@"[DEBUG] Ti.AlternateIcons: Icon has been changed to %@.", iconName);
        }
    }];
#else
    NSLog(@"[ERROR] Ti.AlternateIcons: This feature is only available on iOS 10.3 and later.");
#endif
}
-(void)setDefaultIconName:(id)unused
{
    ENSURE_ARG_COUNT(unused, 0);
    [self setAlternateIconName:nil];
}

@end
