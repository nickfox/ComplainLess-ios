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
#import "NSDate+Utilities.h"

@interface WSFirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet CoolButton *coolButton;

@end

@implementation WSFirstViewController {
    JDFlipNumberView *flipNumberView;
}

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
    
    BOOL isFirstLaunch = ![[NSUserDefaults standardUserDefaults] boolForKey:@"isNotFirstLaunch"];
    if (isFirstLaunch)
    {        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isNotFirstLaunch"];
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"startDate"];
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"currentDate"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *startDate1 = [dateFormatter dateFromString: @"2013-06-03"];
    NSDate *endDate = [dateFormatter dateFromString: @"2013-06-05"];
    NSInteger difference = [startDate1 numberOfDaysUntil:endDate];
    
    NSLog(@"startDate: %@", [dateFormatter stringFromDate:startDate1]);
    NSLog(@"endDate: %@", [dateFormatter stringFromDate:endDate]);
    NSLog(@"numberOfDays: %d", difference);
    
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    NSDate *startDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"startDate"];
    self.startDateLabel.text =  [NSString stringWithFormat:@"Start Date: %@", [dateFormatter stringFromDate:startDate]];
   

    flipNumberView = [[JDFlipNumberView alloc] initWithDigitCount:2];
    flipNumberView.value = 1;

    [self.view addSubview: flipNumberView];
    flipNumberView.frame = CGRectMake(95,175,300,100);
}

- (IBAction)startOverTapped:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"currentDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    flipNumberView.value = 1;
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
