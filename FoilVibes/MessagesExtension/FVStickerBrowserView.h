//
//  FVStickerBrowserView.h
//  FoilVibes
//
//  Created by Tyler Kuster on 12/20/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import <Messages/Messages.h>

@protocol FVStickerBrowserViewDelegate <NSObject>

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;

@end

@interface FVStickerBrowserView : MSStickerBrowserView

@property (weak, nonatomic) id<FVStickerBrowserViewDelegate> delegate;

@end
