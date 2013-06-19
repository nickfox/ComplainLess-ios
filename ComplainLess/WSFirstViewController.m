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
#import "SlidingMessageView.h"

@interface WSFirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *startDateLabel;
@property (weak, nonatomic) IBOutlet CoolButton *coolButton;
@property (weak, nonatomic) IBOutlet UILabel *personalBestLabel;

@end

@implementation WSFirstViewController {
    JDFlipNumberView *flipNumberView;
    BOOL viewDidLoadCalled;
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
    
     NSLog(@"viewDidLoad");
    
    BOOL isFirstLaunch = ![[NSUserDefaults standardUserDefaults] boolForKey:@"isNotFirstLaunch"];
    if (isFirstLaunch)
    {        
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isNotFirstLaunch"];
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"startDate"];
        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"currentBestDate"];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"personalBest"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    //NSDate *startDate1 = [dateFormatter dateFromString: @"2013-06-03"];
    //NSDate *endDate = [dateFormatter dateFromString: @"2013-06-05"];
    //NSInteger numberOfDaysCompleted = [startDate1 numberOfDaysUntil:endDate];
        
    NSDate *startDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"startDate"];
    self.startDateLabel.text =  [NSString stringWithFormat:@"Start Date: %@", [dateFormatter stringFromDate:startDate]];
   
    flipNumberView = [[JDFlipNumberView alloc] initWithDigitCount:2];
    flipNumberView.frame = CGRectMake(95,175,300,100);
    [self.view addSubview: flipNumberView];
    
    viewDidLoadCalled = TRUE;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateUI)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void) updateUI {
    NSLog(@"updateUI");
    
    NSDate *todaysDate = [NSDate date];
    NSDate *currentBestDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentBestDate"];
    NSInteger numberOfDaysCompleted = [currentBestDate numberOfDaysUntil:todaysDate];
    NSInteger personalBest = [[NSUserDefaults standardUserDefaults] integerForKey:@"personalBest"];
    
    if (numberOfDaysCompleted > personalBest) {
        [[NSUserDefaults standardUserDefaults] setInteger:numberOfDaysCompleted forKey:@"personalBest"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    flipNumberView.value = numberOfDaysCompleted;
    
    if (numberOfDaysCompleted == 1) {
        self.personalBestLabel.text =  [NSString stringWithFormat:@"Personal Best: %d Day", numberOfDaysCompleted];
    } else {
        self.personalBestLabel.text =  [NSString stringWithFormat:@"Personal Best: %d Days", numberOfDaysCompleted];
    }
    
}

- (IBAction)startOverTapped:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"currentBestDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    flipNumberView.value = 0;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    SlidingMessageView *msgView = [[SlidingMessageView alloc] initWithFrame:CGRectMake(0, -60.0, self.view.bounds.size.width, 60.0)];
    [msgView setTitle:@"Alert"];
    [msgView setMessage:[NSString stringWithFormat:@"Start time reset to %@", [dateFormatter stringFromDate:[NSDate date]]]];
    
    [self.view addSubview:msgView];
    [msgView showMessageWithDelay:4];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear");
    NSLog(viewDidLoadCalled ? @"viewDidLoadCalled: Yes" : @"viewDidLoadCalled: No");
    
    // so updateUI not called twice when viewDidLoadCalled is called 
    if (viewDidLoadCalled) {
        viewDidLoadCalled = NO;
    } else {
        [self updateUI];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
