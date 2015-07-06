//
//  WellComeVC.m
//  TheColors
//
//  Created by GreenGlobal on 6/16/15.
//  Copyright (c) 2015 GreenGlobal. All rights reserved.
//

#import "WellComeVC.h"
#import <iAd/iAd.h>

@interface WellComeVC ()<ADBannerViewDelegate>{
//    ADBannerView *_adView;
}

@end

@implementation WellComeVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // NSArray *a = [[NSArray alloc] init];
    NSLog(@"%@", a[1]);
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
//    _adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, 320, 50)];
//    _adView.delegate = self;
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
//
//#pragma mark - iAD Delegate
//- (void)bannerViewDidLoadAd:(ADBannerView *)banner{
//    if (_adView.superview == nil)
//    {
//        [self.view addSubview:_adView];
//    } else {
//        [_adView removeFromSuperview];
//        [self.view addSubview:_adView];
//    }
//}
//
//- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
//    NSLog(@"Error: %@", error.localizedDescription);
//}

@end
