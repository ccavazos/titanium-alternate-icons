/**
 * titanium-alternate-icons
 *
 * Created by Your Name
 * Copyright (c) 2017 Your Company. All rights reserved.
 */

#import "TiModule.h"

@interface TiAlternateiconsModule : TiModule

- (NSNumber *)isSupported:(id)unused;

- (NSNumber *)supportsAlternateIcons:(id)unused;

- (NSString *)alternateIconName:(id)unused;

- (void)setAlternateIconName:(id)args;

- (void)setDefaultIconName:(id)args;

@end
