//
//  iADViewController.h
//  FreakingMath
//
//  Created by Pham Ngoc Thao on 6/27/15.
//  Copyright (c) 2015 Pham Ngoc Thao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@protocol iADViewControllerDelegate <NSObject>

- (void)iAdDidLoad;

@end

@interface iADViewController : NSObject

@property (strong, nonatomic) ADBannerView *adView;
@property (assign, nonatomic) BOOL isLoaded;

@property (weak) id<iADViewControllerDelegate>delegate;

+ (iADViewController *)shareInstance;



@end
