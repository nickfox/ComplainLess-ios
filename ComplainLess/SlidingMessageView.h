//
//  SlidingMessageView.h
//  SlideView
//
//  Created by Nick Fox on 12/30/11.
//  Copyright (c) 2011 websmithing.com. All rights reserved.
//


@interface SlidingMessageView : UIView

- (void)setTitle:(NSString *)title;
- (void)setMessage:(NSString *)message;
- (void)showMessageWithDelay:(int)delay;

@end
