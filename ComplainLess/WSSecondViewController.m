//
//  WSSecondViewController.m
//  ComplainLess
//
//  Created by Nick Fox on 5/26/13.
//  Copyright (c) 2013 Nick Fox. All rights reserved.
//

#import "WSSecondViewController.h"

@interface WSSecondViewController ()

@end

@implementation WSSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"About", @"About");
        self.tabBarItem.image = [UIImage imageNamed:@"info"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

@end
