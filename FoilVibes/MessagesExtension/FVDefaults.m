//
//  FVDefaults.m
//  FoilVibes
//
//  Created by Tyler Kuster on 12/21/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import "FVDefaults.h"

@implementation FVDefaults

+ (NSDictionary*)stickerTextViewAttributes
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineHeightMultiple = 45.0f;
    paragraphStyle.maximumLineHeight = 45.0f;
    paragraphStyle.minimumLineHeight = 45.0f;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSString *string = @"Happy\nNew Year!";
    NSDictionary *attributes = @{
                                NSParagraphStyleAttributeName : paragraphStyle,
                                NSFontAttributeName : [UIFont fontWithName:@"Selima" size:48.0],
                                };
    return attributes;
}

@end
