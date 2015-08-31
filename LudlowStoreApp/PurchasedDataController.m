//
//  PurchasedDataController.m
//  LudlowStoreApp
//
//  Created by Rutan on 8/31/15.
//  Copyright (c) 2015 EricLudlowRadicalApplications. All rights reserved.
//

#import "PurchasedDataController.h"
#import "StorePurchaseController.h"

static NSString * const kAdsRemovedKey = @"kAdsRemovedKey";

@interface PurchasedDataController ()

@property (assign, nonatomic, readwrite) BOOL adsRemoved;

@end

@implementation PurchasedDataController

+ (PurchasedDataController *)sharedInstance {
    static PurchasedDataController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PurchasedDataController new];
        [sharedInstance loadFromDefaults];
        [sharedInstance registerForNotifications];
    });
    
    return sharedInstance;
}

- (void)loadFromDefaults {
    
    self.adsRemoved = [[NSUserDefaults standardUserDefaults] boolForKey:kAdsRemovedKey];
}

- (void)registerForNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(purchaseNotificationFired:)
                                                 name:kInAppPurchaseCompletedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(purchaseNotificationFired:)
                                                 name:kInAppPurchaseRestoredNotification
                                               object:nil];
}

- (void)purchaseNotificationFired:(NSNotification *)notification {
    
    NSString *productID = notification.userInfo[kProductIDKey];
    
    // *** remember to put name of in-app purchase product here: ***
    if ([productID isEqualToString:@"com.ludlowapplications.MyiAdApp.removeAds"]) {
        self.adsRemoved = YES;
        
        [[NSUserDefaults standardUserDefaults] setBool:self.adsRemoved forKey:kAdsRemovedKey];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kPurchasedContentUpdated object:nil];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
