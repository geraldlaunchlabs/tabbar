//
//  FirstViewController.m
//  TabBar
//
//  Created by LLDM on 27/07/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"FirstViewController Loaded...");
    //[self addImageView];
    [self addImageViewWithAnimation];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addImageView{
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 355, 400)];
    [imgview setImage:[UIImage imageNamed:@"AppleUSA1.png"]];
    [imgview setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imgview];
}

-(void)addImageViewWithAnimation{
    UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, 275, 300)];
    // set an animation
    imgview.animationImages = [NSArray arrayWithObjects: [UIImage imageNamed:@"AppleUSA1.png"],[UIImage imageNamed:@"AppleUSA2.png"],[UIImage imageNamed:@"AppleUSA3.png"], nil];
    imgview.animationDuration = 0.3; imgview.contentMode = UIViewContentModeCenter; [imgview startAnimating];
    [imgview setContentMode:UIViewContentModeScaleAspectFit];
    [self.view addSubview:imgview];
}

@end
