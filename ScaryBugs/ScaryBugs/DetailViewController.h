//
//  DetailViewController.h
//  ScaryBugs
//
//  Created by Rachel Schifano on 1/2/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

