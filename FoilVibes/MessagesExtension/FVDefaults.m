//
//  FVDefaults.m
//  FoilVibes
//
//  Created by Tyler Kuster on 12/21/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import "FVDefaults.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation FVDefaults

+ (NSDictionary*)stickerTextViewAttributes
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    UIFont* fontStyle;
    
    NSLog(@"this is a:%@", [self platformString]);
    if ([[self platformString] isEqualToString:@"iPhone 6+"])
    {
        paragraphStyle.lineHeightMultiple = 142.0f;
        paragraphStyle.maximumLineHeight = 142.0f;
        paragraphStyle.minimumLineHeight = 142.0f;
        
        fontStyle = [UIFont fontWithName:@"Selima" size:150.0];
    } else
    {
        paragraphStyle.lineHeightMultiple = 45.0f;
        paragraphStyle.maximumLineHeight = 45.0f;
        paragraphStyle.minimumLineHeight = 45.0f;
        
        fontStyle = [UIFont fontWithName:@"Selima" size:48.0];
    }
    
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{
                                NSParagraphStyleAttributeName : paragraphStyle,
                                NSFontAttributeName : fontStyle,
                                };
    return attributes;
}

+ (NSString *)platform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)platformString
{
    NSString* platform = [self platform];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6+";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

@end
