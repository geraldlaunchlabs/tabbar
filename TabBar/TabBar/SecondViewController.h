//
//  SecondViewController.h
//  TabBar
//
//  Created by LLDM on 27/07/2016.
//  Copyright © 2016 LLDM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UIScrollViewDelegate> {
    UIScrollView *myScrollView;
    UIImageView *imgView;
    IBOutlet UITableView *myTableView;
    NSMutableArray *myData;
}
@end

