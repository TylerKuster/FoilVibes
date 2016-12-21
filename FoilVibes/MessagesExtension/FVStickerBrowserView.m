//
//  FVStickerBrowserView.m
//  FoilVibes
//
//  Created by Tyler Kuster on 12/20/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import "FVStickerBrowserView.h"

@interface FVStickerBrowserView () <UITextViewDelegate>

@property (nonatomic, retain) UITextView* stickerTextView;

@end

@implementation FVStickerBrowserView

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
    self.stickerTextView = [[UITextView alloc] initWithFrame:self.bounds];
    self.stickerTextView.delegate = self;
    self.stickerTextView.backgroundColor = [UIColor clearColor];
    self.stickerTextView.clipsToBounds = NO;
    self.stickerTextView.textAlignment = NSTextAlignmentCenter;
    self.stickerTextView.text = @"Happy New Year!";

    self.stickerTextView.font = [UIFont fontWithName:@"Selima" size:60];
    
    [self addSubview: self.stickerTextView];
}

#pragma mark - UITextView Delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [self.delegate textViewShouldBeginEditing:textView];
    
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
