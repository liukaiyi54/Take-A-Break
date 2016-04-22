//
//  ViewController.m
//  Take A Break
//
//  Created by 刘凯 on 4/21/16.
//  Copyright © 2016 Michael. All rights reserved.
//

#import "ViewController.h"
#import "ICDColorMacros.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIButton *button;
@property (nonatomic, strong) UILocalNotification *notification;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button.layer.cornerRadius = CGRectGetWidth(self.button.bounds)/2;
    [self.button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didTapButton:(UIButton *)sender {
    [self toggleState];
}

- (void)toggleState {
    if ([self.button.titleLabel.text isEqualToString:@"Start"]) {
        [self.button setTitle:@"Stop" forState:UIControlStateNormal];
        [self.button setBackgroundColor:UIColorFromRGB(0xff6666)];
        [self scheduleNotification];
    } else {
        [self.button setTitle:@"Start" forState:UIControlStateNormal];
        [self.button setBackgroundColor:UIColorFromRGB(0x66ccff)];
        [self cancelNotification];
    }
}

- (void)saveButtonState {
    
}

- (void)scheduleNotification {
    if (!self.notification) {
        self.notification = [[UILocalNotification alloc] init];
        self.notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:60*60];
        self.notification.timeZone = [NSTimeZone defaultTimeZone];
        self.notification.alertBody = @"Hello, 看我";
        self.notification.soundName = UILocalNotificationDefaultSoundName;
        self.notification.repeatInterval = NSCalendarUnitHour;
    }
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
    [[UIApplication sharedApplication] scheduleLocalNotification:self.notification];
}

- (void)cancelNotification {
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end
