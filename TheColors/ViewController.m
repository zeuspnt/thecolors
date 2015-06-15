//
//  ViewController.m
//  TheColors
//
//  Created by GreenGlobal on 6/15/15.
//  Copyright (c) 2015 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
    __weak IBOutlet UIProgressView *_progressBar;
    __weak IBOutlet UILabel *_lblTheColors;
    
    NSTimer *_timer;
    NSArray *_arrayColors, *_arrayColorsName;
    BOOL _result;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    _arrayColors = @[[UIColor blackColor],[UIColor grayColor],[UIColor redColor],[UIColor greenColor],[UIColor blueColor],[UIColor cyanColor],[UIColor yellowColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor purpleColor],[UIColor brownColor]];
    
    _arrayColorsName = @[@"Black",@"Gray",@"Red",@"Green",@"Blue",@"Cyan",@"Yellow",@"Magenta",@"Orange",@"Purple",@"Brown"];
    NSLog(@"%d - %d", _arrayColorsName.count, _arrayColors.count);
    
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

- (void)tick{
    _progressBar.progress -=0.01f;
    if (_progressBar.progress == 0) {
        //Game Over
        [self endGame];
    }
}

- (void)startGame{
    _progressBar.progress = 1.f;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(tick) userInfo:nil repeats:YES];
    [self randomColor:NO];
}

- (void)endGame{
    _progressBar.progress = 0;
    [_timer invalidate];
    _timer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnYesTapped:(id)sender {
}
- (IBAction)btnNoTapped:(id)sender {
}
@end
