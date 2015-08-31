//
//  ViewController.m
//  LudlowStoreApp
//
//  Created by Rutan on 8/31/15.
//  Copyright (c) 2015 EricLudlowRadicalApplications. All rights reserved.
//

#import "ViewController.h"
@import iAd;

@interface ViewController ()

@property (strong, nonatomic) ADBannerView *adBannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.adBannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    self.adBannerView.frame = CGRectMake(0, (self.view.frame.size.height - self.adBannerView.frame.size.height), self.adBannerView.frame.size.width, self.adBannerView.frame.size.height);
    
    [self.view addSubview:self.adBannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
