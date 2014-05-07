//
//  CoolButton.h
//  CoolButton
//
//  Created by Brian Moakley on 2/21/13.
//  Copyright (c) 2013 Razeware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolButton : UIButton

@property  (nonatomic, assign) CGFloat hue;
@property  (nonatomic, assign) CGFloat saturation;
@property  (nonatomic, assign) CGFloat brightness;

@end
