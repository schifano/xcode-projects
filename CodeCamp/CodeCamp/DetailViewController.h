//
//  DetailViewController.h
//  CodeCamp
//
//  Created by Rachel Schifano on 1/7/15.
//  Copyright (c) 2015 Square College Code Camp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

