//
//  MessagesViewController.m
//  MessagesExtension
//
//  Created by Tyler Kuster on 12/20/16.
//  Copyright © 2016 Tyler Kuster. All rights reserved.
//

#import "MessagesViewController.h"
#import "FVDefaults.h"
//#import "FVStickerBrowserView.h"
#import "FVStickerView.h"

@interface MessagesViewController () <FVStickerViewDelegate>

@property (nonatomic, retain) IBOutlet UIView* paperView;
//@property (nonatomic, retain) IBOutlet FVStickerBrowserView* stickerBrowserView;
@property (nonatomic, retain) IBOutlet FVStickerView* stickerView;
@property (nonatomic, retain) IBOutlet UITextView* stickerTextView;
@property (nonatomic, retain) IBOutlet NSLayoutConstraint* stickerTextViewCenterY;

@end

@implementation MessagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.stickerView.delegate = self;
    CGFloat degrees = -4.0; // Because I'm cray
    self.stickerView.transform = CGAffineTransformMakeRotation(degrees * M_PI/180);
    //FVStickerBrowserViewController* test = [[FVStickerBrowserViewController alloc]initWithStickerSize:MSStickerSizeRegular];
    //MSStickerBrowserView* testView = [[MSStickerBrowserView alloc] initWithFrame:self.view.bounds stickerSize:MSStickerSizeRegular];
    //test.view.frame = CGRectMake(0.0f, 0.0f, 100, 100);
    //test.view.backgroundColor = [UIColor orangeColor];
   // [self addChildViewController:test];
   // [test didMoveToParentViewController:self];
    
  //  [self.paperView addSubview:test.view];
    
   // [test.stickerBrowserView reloadData];
    
    
    //self.stickerTextView = [[UITextView alloc]initWithFrame:CGRectMake(25, 25, 324, 420)];
    //self.stickerTextView.textContainerInset = UIEdgeInsetsMake(0, 0, 0, 0);
    //self.stickerTextView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.0];
    //self.stickerTextView.textAlignment = NSTextAlignmentCenter;
    //self.stickerTextView.font = [UIFont fontWithName:@"Selima" size:60];
    //self.stickerTextView.textColor = [UIColor blackColor];
    self.stickerTextView.userInteractionEnabled = NO;
    
    [self.view insertSubview:self.stickerTextView atIndex:0];
    self.stickerTextView.text = @"Happy\nNew Year!";
    
    
    
    self.stickerTextView.textAlignment = NSTextAlignmentCenter;
    self.stickerTextView.attributedText = [[NSAttributedString alloc] initWithString:self.stickerTextView.text
                                                                          attributes:[FVDefaults stickerTextViewAttributes]];
    
    //NSLog(@"reported x:%f y:%f w:%f h:%f", self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    UIImageView* imageOverlay = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    imageOverlay.image = [UIImage imageNamed:@"bluePattern1.png"];
    imageOverlay.maskView = self.stickerTextView;
    
    [self.view addSubview:imageOverlay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (void)saveImageWithView:(UIView *)view
{
    self.imageName = [NSString stringWithFormat:@"foilSticker.png"];
    
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, !view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString* path = [documentsDirectory stringByAppendingPathComponent:self.imageName];
    NSData* data = UIImagePNGRepresentation(img);
    [data writeToFile:path atomically:YES];
    
    //    NSData *imageData = UIImagePNGRepresentation(img);
    //
    //    NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //    NSString *imageSubdirectory = [documentsDirectory stringByAppendingPathComponent:@"MySubfolderName"];
    //
    //    NSString *filePath = [imageSubdirectory stringByAppendingPathComponent:@"Image.png"];
    //
    //    NSLog(@"filePath = %@", filePath);
    ////     Convert UIImage object into NSData (a wrapper for a stream of bytes) formatted according to PNG spec
    //
    //    [imageData writeToFile:filePath atomically:YES];
    //
    //    // Create path.
    //    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"Image.png"];
    //
    //    // Save image.
    //    [UIImagePNGRepresentation(img) writeToFile:filePath atomically:YES];
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //[self.stickerBrowserView reloadData];
    //    });
    
}
*/
#pragma mark - Sticker Browser View

- (void)test
{
    [self requestPresentationStyle:MSMessagesAppPresentationStyleExpanded];
}

#pragma mark - Conversation Handling

-(void)didBecomeActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the inactive to active state.
    // This will happen when the extension is about to present UI.
    
    // Use this method to configure the extension and restore previously stored state.
}

-(void)willResignActiveWithConversation:(MSConversation *)conversation {
    // Called when the extension is about to move from the active to inactive state.
    // This will happen when the user dissmises the extension, changes to a different
    // conversation or quits Messages.
    
    // Use this method to release shared resources, save user data, invalidate timers,
    // and store enough state information to restore your extension to its current state
    // in case it is terminated later.
}

-(void)didReceiveMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when a message arrives that was generated by another instance of this
    // extension on a remote device.
    
    // Use this method to trigger UI updates in response to the message.
}

-(void)didStartSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user taps the send button.
}

-(void)didCancelSendingMessage:(MSMessage *)message conversation:(MSConversation *)conversation {
    // Called when the user deletes the message without sending it.
    
    // Use this to clean up state related to the deleted message.
}

-(void)willTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called before the extension transitions to a new presentation style.
    
    // Use this method to prepare for the change in presentation style.
}

-(void)didTransitionToPresentationStyle:(MSMessagesAppPresentationStyle)presentationStyle {
    // Called after the extension transitions to a new presentation style.
    if (presentationStyle == MSMessagesAppPresentationStyleExpanded)
    {
        [self.stickerTextView becomeFirstResponder];
        self.stickerTextView.userInteractionEnabled = YES;
        
        self.stickerView.layer.zPosition = -1;
        self.stickerView.userInteractionEnabled = NO;
        [self.view bringSubviewToFront:self.stickerTextView];
        
        self.stickerTextViewCenterY.constant = 200;
        
        [UIView animateWithDuration:0.2 animations:^(void) {
            [self.stickerTextView layoutIfNeeded];
        }];
    }
    
    // Use this method to finalize any behaviors associated with the change in presentation style.
}

@end
