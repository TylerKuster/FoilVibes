//
//  FVStickerView.m
//  FoilVibes
//
//  Created by Tyler Kuster on 12/20/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import "FVStickerView.h"

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
    self.backgroundColor = [UIColor orangeColor];

    NSURL *imgPath = [[NSBundle mainBundle] URLForResource:@"potato" withExtension:@"png"];
    
    MSSticker* sideNoteSticker = [[MSSticker alloc]initWithContentsOfFileURL:imgPath localizedDescription:@"sure" error:NULL];
    
    self.sticker = sideNoteSticker;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
