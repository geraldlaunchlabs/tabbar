//
//  SecondViewController.m
//  TabBar
//
//  Created by LLDM on 27/07/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addScrollView];
    myData = [[NSMutableArray alloc]initWithObjects:
              @"Data 1 in array",@"Data 2 in array",@"Data 3 in array", @"Data 4 in array",@"Data 5 in array",@"Data 5 in array", @"Data 6 in array",@"Data 7 in array",@"Data 8 in array", @"Data 9 in array", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addScrollView{
    myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 20, 335, 580)];
    myScrollView.accessibilityActivationPoint = CGPointMake(100, 100);
    imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AppleUSA1.png"]];
    [myScrollView addSubview:imgView];
    myScrollView.minimumZoomScale = 0.5;
    myScrollView.maximumZoomScale = 3;
    myScrollView.contentSize = CGSizeMake(imgView.frame.size.width, imgView.frame.size.height);
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imgView;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"Did end decelerating");
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // NSLog(@"Did scroll");
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"Did end dragging");
}
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"Did begin decelerating");
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{ NSLog(@"Did begin dragging");
}

#pragma mark - Table View Data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [myData count]/2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSString *stringForCell;
    if (indexPath.section == 0) {
        stringForCell= [myData objectAtIndex:indexPath.row];
    } else if (indexPath.section == 1) {
        stringForCell= [myData objectAtIndex:indexPath.row+ [myData count]/2];
    }
    [cell.textLabel setText:stringForCell]; return cell;
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *headerTitle;
    if (section==0) {
        headerTitle = @"Section 1 Header";
    }
    else{
        headerTitle = @"Section 2 Header";
    }
    return headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    NSString *footerTitle;
    if (section==0) {
        footerTitle = @"Section 1 Footer";
    } else {
        footerTitle = @"Section 2 Footer";
    }
    return footerTitle;
}

#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%ld Row:%ld selected and its data is %@", (long)indexPath.section,(long)indexPath.row,cell.textLabel.text);
}

@end
