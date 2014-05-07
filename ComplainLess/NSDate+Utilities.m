//
//  NSDate+Utilities.m
//  ComplainLess
//
//  Created by Nick Fox on 6/7/13.
//  Copyright (c) 2013 Nick Fox. All rights reserved.
//

#import "NSDate+Utilities.h"

@implementation NSDate (Utilities)

// NSDateFormatter *df = [[NSDateFormatter alloc] init];
// [df setDateFormat:@"yyyy-MM-dd hh:mm:ss a"];
// NSDate *startDate = [df dateFromString: @"2010-11-01"];
// NSDate *endDate = [df dateFromString: @"2010-11-03"];
// NSInteger difference = [startDate numberOfDaysUntil:endDate];
// NSLog(@"Diff = %ld", difference);

- (NSInteger)numberOfDaysUntil:(NSDate *)aDate {
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [gregorianCalendar components:NSDayCalendarUnit fromDate:self toDate:aDate options:0];
    
    return [components day];
}

@end
