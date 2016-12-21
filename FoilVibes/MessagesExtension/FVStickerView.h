//
//  FVStickerView.h
//  FoilVibes
//
//  Created by Tyler Kuster on 12/20/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import <Messages/Messages.h>

@protocol FVStickerViewDelegate <NSObject>

- (void)test;

@end

@interface FVStickerView : MSStickerView

@property (weak, nonatomic) id<FVStickerViewDelegate> delegate;

@property (nonatomic, retain) MSSticker* foilSticker;

@end
