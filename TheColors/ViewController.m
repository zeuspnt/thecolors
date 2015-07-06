//
//  ViewController.m
//  TheColors
//
//  Created by GreenGlobal on 6/15/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "GameOverVC.h"
#import <iAd/iAd.h>

CGFloat const kTotalSec = 2.f;

@interface ViewController ()<ADBannerViewDelegate>{
    
    __weak IBOutlet UIProgressView *_progressBar;
    __weak IBOutlet UILabel *_lblTheColors;
    
    __weak IBOutlet UIButton *_btnYes;
    __weak IBOutlet UIButton *_btnNo;
    NSTimer *_timer;
    NSArray *_arrayColors, *_arrayColorsName;
    BOOL _result;
    NSInteger _score;
    CGFloat _sec;
    
//    ADBannerView *_adView;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _btnYes.layer.masksToBounds = YES;
    _btnYes.layer.cornerRadius = 5.f;
    _btnNo.layer.masksToBounds = YES;
    _btnNo.layer.cornerRadius = 5.f;
    
    _arrayColors = @[[UIColor blackColor],[UIColor grayColor],[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor cyanColor],[UIColor yellowColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor],[UIColor brownColor]];
    
    _arrayColorsName = @[@"Black",@"Gray",@"Red",@"Green",@"Blue",@"Cyan",@"Yellow",@"Magenta",@"Orange",@"Purple",@"Brown"];

//    _adView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, 320, 50)];
//    _adView.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    [self startGame];
    
    
}


- (void)randomColor:(BOOL)right{
    
    if (right) {
        NSInteger i = arc4random() % _arrayColors.count;
        _lblTheColors.textColor = [_arrayColors objectAtIndex:i];
        _lblTheColors.text = [_arrayColorsName objectAtIndex:i];
        _result = YES;
    } else {
        NSInteger i = arc4random() % _arrayColors.count;
        NSInteger j = arc4random() % _arrayColorsName.count;
        _lblTheColors.textColor = [_arrayColors objectAtIndex:i];
        _lblTheColors.text = [_arrayColorsName objectAtIndex:j];
        if (i == j) {
            _result = YES;
        } else {
            _result = NO;
        }
    }
}

- (void)next{
    _sec = kTotalSec;
    _progressBar.progress = 1.f;
    _score ++;
    NSInteger ran = arc4random() % 2;
    if (ran == 0) {
        [self randomColor:YES];
    } else {
        [self randomColor:NO];
    }
}

- (void)tick{
    _sec -= 0.01f;
    _progressBar.progress = _sec/kTotalSec;
    if (_progressBar.progress == 0) {
        //Game Over
        [self endGame];
    }
}

- (void)startGame{
    _score = 0;
    _sec = kTotalSec;
    _progressBar.progress = 1;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self randomColor:NO];
}

- (void)endGame{
    _progressBar.progress = 0;
    [_timer invalidate];
    _timer = nil;
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    GameOverVC *vc = [sb instantiateViewControllerWithIdentifier:@"GameOverVC"];
    vc.score = _score;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnYesTapped:(id)sender {
    if (_result) {
        [self next];
    } else {
        [self endGame];
    }
}
- (IBAction)btnNoTapped:(id)sender {
    if (!_result) {
        [self next];
    } else {
        [self endGame];
    }
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
