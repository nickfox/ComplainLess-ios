//
//  WSFirstViewController.m
//  ComplainLess
//
//  Created by Nick Fox on 5/26/13.
//  Copyright (c) 2013 Nick Fox. All rights reserved.
//

#import "WSFirstViewController.h"
#import "CoolButton.h"
#import "JDFlipNumberView.h"

@interface WSFirstViewController ()

@property (weak, nonatomic) IBOutlet CoolButton *coolButton;

@end

@implementation WSFirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Tracker", @"Tracker");
        self.tabBarItem.image = [UIImage imageNamed:@"reminder"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create a new FlipNumberView, set a value, start an animation
    JDFlipNumberView *flipNumberView = [[JDFlipNumberView alloc] initWithDigitCount:2];
    flipNumberView.value = 17;
    [flipNumberView animateDownWithTimeInterval: 1.0];
    
    // add to view hierarchy and resize
    [self.view addSubview: flipNumberView];
    flipNumberView.frame = CGRectMake(95,150,300,100);
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
