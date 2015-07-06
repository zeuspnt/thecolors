//
//  GameOverVC.m
//  TheColors
//
//  Created by GreenGlobal on 6/16/15.
//  Copyright (c) 2015 GreenGlobal. All rights reserved.
//

#import "GameOverVC.h"
#import <iAd/iAd.h>

@interface GameOverVC ()<ADBannerViewDelegate>{
    
    __weak IBOutlet UILabel *_lblScore;
    __weak IBOutlet UILabel *_lblBest;
    
//    ADBannerView *_adView;
}

@end

@implementation GameOverVC

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
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *strBest = [def stringForKey:@"best"];
    
    NSInteger best = 0;
    if (strBest.length > 0) {
        best = [strBest integerValue];
    }
    
    if (self.score > best) {
        best = self.score;
        [def setObject:[NSString stringWithFormat:@"%d", best] forKey:@"best"];
        [def synchronize];
    }
    
    _lblScore.text = [NSString stringWithFormat:@"%d", self.score];
    _lblBest.text = [NSString stringWithFormat:@"%d", best];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
//    _adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, 320, 50)];
//    [self.view addSubview:_adView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
- (IBAction)btnPlayTapped:(id)sender {
}

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
