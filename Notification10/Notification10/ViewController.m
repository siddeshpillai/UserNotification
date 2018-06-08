//
//  ViewController.m
//  Notification10
//
//  Created by Siddesh Pillai on 5/29/18.
//  Copyright © 2018 Siddesh Pillai. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Press Me" forState:UIControlStateNormal];
    [button sizeToFit];
    button.center = CGPointMake(320/2, 60);
    
    // Add an action in current code file (i.e. target)
    [button addTarget:self action:@selector(buttonPressed:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}


- (void)buttonPressed:(UIButton *)button {
    NSLog(@"Button Pressed");
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"title";
    content.body = @"message";
    content.sound = [UNNotificationSound defaultSound];
    content.badge = @([[UIApplication sharedApplication] applicationIconBadgeNumber] + 1);
    
    // create trigger time
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1000/1000
                                                                                                    repeats:NO];
    
    // unique identifier
    NSString* identifierNSString = @"identifier.toString().toNSString()";
    
    // create notification request
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifierNSString
                                                                          content:content trigger:trigger];
    
    // add request
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Local Notification failed");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
