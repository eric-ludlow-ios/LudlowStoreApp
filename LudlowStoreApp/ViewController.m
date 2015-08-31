//
//  ViewController.m
//  LudlowStoreApp
//
//  Created by Rutan on 8/31/15.
//  Copyright (c) 2015 EricLudlowRadicalApplications. All rights reserved.
//

#import "ViewController.h"
@import iAd;

@interface ViewController () <ADBannerViewDelegate>

@property (strong, nonatomic) ADBannerView *adBannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.adBannerView = [[ADBannerView alloc] initWithAdType:ADAdTypeBanner];
    self.adBannerView.frame = CGRectMake(0, (- self.adBannerView.frame.size.height), self.adBannerView.frame.size.width, self.adBannerView.frame.size.height);
    self.adBannerView.delegate = self;
    
    [self.view addSubview:self.adBannerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - AdBannerView Delegate Methods

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    
    [UIView animateWithDuration:1.0 animations:^{
        banner.frame = CGRectMake(0, 0, banner.frame.size.width, banner.frame.size.height);
    }];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    
    [UIView animateWithDuration:1.0 animations:^{
        banner.frame = CGRectMake(0, (- banner.frame.size.height), banner.frame.size.width, banner.frame.size.height);
    }];
}

@end
