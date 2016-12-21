//
//  FVStickerView.m
//  FoilVibes
//
//  Created by Tyler Kuster on 12/20/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import "FVStickerView.h"

@interface FVStickerView ()



@end

@implementation FVStickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    // Make the codes here
    self.backgroundColor = [UIColor clearColor];

    NSURL *imgPath = [[NSBundle mainBundle] URLForResource:@"potato" withExtension:@"png"];
    
//    self.foilSticker = [[MSSticker alloc]initWithContentsOfFileURL:imgPath localizedDescription:@"sure" error:NULL];
    
    self.sticker = self.foilSticker;
    self.contentMode = UIViewContentModeScaleAspectFill;
    
    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];

    [self addGestureRecognizer:singleFingerTap];
}

- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer
{
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"two for two, fuck yeah");
    [self.delegate test];
    //Do stuff here...
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
