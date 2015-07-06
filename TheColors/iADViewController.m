//
//  iADViewController.m
//  FreakingMath
//
//  Created by Pham Ngoc Thao on 6/27/15.
//  Copyright (c) 2015 Pham Ngoc Thao. All rights reserved.
//

#import "iADViewController.h"


@interface iADViewController ()<ADBannerViewDelegate>{
    
}

@end

@implementation iADViewController

- (id)init{
    self = [super init];
    if (self) {
        // Custom initialization
        _adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50, 320, 50)];
        _adView.delegate = self;
    }
    return self;
}

+ (iADViewController *)shareInstance{
    static iADViewController * _shareObject = nil;
    if (_shareObject == nil) {
        static dispatch_once_t p;
        
        dispatch_once(&p, ^{
            _shareObject = [[iADViewController alloc] init];
        });
    }
    
    return _shareObject;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - iAD Delegate
- (void)bannerViewDidLoadAd:(ADBannerView *)banner{

    self.isLoaded = YES;
    if ([self.delegate respondsToSelector:@selector(iAdDidLoad)]) {
        [self.delegate iAdDidLoad];
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    NSLog(@"Error: %@", error.localizedDescription);
    self.isLoaded = NO;
}
@end
