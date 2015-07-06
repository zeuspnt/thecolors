//
//  ParentVC.m
//  TheColors
//
//  Created by Pham Ngoc Thao on 7/3/15.
//  Copyright (c) 2015 Pham Ngoc Thao. All rights reserved.
//

#import "ParentVC.h"
#import "iADViewController.h"

@interface ParentVC ()<iADViewControllerDelegate>{
    iADViewController *_iad;
}

@end

@implementation ParentVC

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
    
    _iad = [iADViewController shareInstance];
    _iad.delegate = self;
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self iAdDidLoad];
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


#pragma mark - iadViewController Delegate
- (void)iAdDidLoad{
    if (_iad.isLoaded) {
        [self.view addSubview:_iad.adView];
        [self.view bringSubviewToFront:_iad.adView];
    }
}
@end
