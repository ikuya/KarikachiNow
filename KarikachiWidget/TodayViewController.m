//
//  TodayViewController.m
//  KarikachiWidget
//
//  Created by Ikuya Fukumoto on 10/17/14.
//  Copyright (c) 2014 if. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
- (IBAction)callPhone:(id)sender;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.preferredContentSize = CGSizeMake(0, 100);
    //self.webView.scalesPageToFit = YES;
    //[self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.hbc.co.jp/weather/roadcamera/current/picture/970000000230.jpg"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    // 通知センターを開くたびにビューを再描画する
    completionHandler(NCUpdateResultNewData);
}

- (IBAction)callPhone:(id)sender {
    // FIXME: 実験用の一時的な実装．openURLでカスタムスキームを投げる
    NSString *phoneNum = self.textField.text;
    NSURL *url = [NSURL URLWithString:[@"tel://" stringByAppendingString:phoneNum]];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        // successがYESなら成功
        if (success) NSLog(@"SUCCESS!");
    }];
}
@end
