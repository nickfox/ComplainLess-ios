//
//  SlidingMessageView.m
//  SlideView
//
//  Created by Nick Fox on 12/30/11.
//  Copyright (c) 2011 websmithing.com. All rights reserved.
//

#import "SlidingMessageView.h"

@interface SlidingMessageView()
{
    UILabel *titleLabel;
    UILabel *messageLabel;
}

- (void)messageInit;

@end

@implementation SlidingMessageView


- (id)initWithFrame:(CGRect)frame
{
    if((self = [super initWithFrame:frame]))
    {
        [self messageInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if((self = [super initWithCoder:aDecoder]))
    {
        [self messageInit];
    }
    return self;
}

- (void)setTitle:(NSString *)theTitle
{
    [titleLabel setText:theTitle];   
}

- (void)setMessage:(NSString *)theMessage
{
    [messageLabel setText:theMessage];  
}

- (void)messageInit
{
    self.opaque          = YES;
    self.alpha           = 0.95;

    UIColor *lightBlue = [UIColor colorWithHue:0.55 saturation:1.0 brightness:1.0 alpha:1.0];
    self.backgroundColor = lightBlue;
    
    titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setContentMode:UIViewContentModeCenter];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [titleLabel setTextColor:[UIColor whiteColor]];

    messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [messageLabel setBackgroundColor:[UIColor clearColor]];
    [messageLabel setTextAlignment:NSTextAlignmentCenter];
    [messageLabel setContentMode:UIViewContentModeCenter];
    [messageLabel setFont:[UIFont boldSystemFontOfSize:13]];
    [messageLabel setTextColor:[UIColor whiteColor]];
    [messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [messageLabel setNumberOfLines:0];
    
    [self addSubview:titleLabel];
    [self addSubview:messageLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect bounds = [self bounds];
    
    CGRect titleFrame    = CGRectZero;
    CGRect messageFrame  = CGRectZero;
    
    titleFrame.size.width   = CGRectGetWidth(bounds);
    messageFrame.size.width = CGRectGetWidth(bounds) - 6.0;
    
    titleFrame.size.height   = 20.0;
    messageFrame.size.height = CGRectGetHeight(bounds) - titleFrame.size.height;
    
    messageFrame.origin.y = CGRectGetMaxY(titleFrame);
    messageFrame.origin.x = 3.0;
    
    [titleLabel   setFrame:titleFrame];
    [messageLabel setFrame:messageFrame];
}

- (void)showMessageWithDelay:(int)theDelay 
{    
    __block CGRect frame = self.frame;
    CGRect bounds = [self bounds];
    
    [UIView animateWithDuration:0.75
                     animations:^{ 
                         frame.origin.y = 0;
                         self.frame     = frame;
                     } 
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:0.75 delay:theDelay 
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^ {
                                              frame.origin.y = self.bounds.origin.y - CGRectGetHeight(bounds);
                                              self.frame     = frame;
                                          }
                                          completion:^(BOOL finished){                                              
                                          }];
                     }];
}

@end
