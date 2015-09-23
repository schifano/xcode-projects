//
//  ViewController.m
//  BlurText
//
//  Created by Rachel Schifano on 9/21/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

#import "ViewController.h"
#import "BlurredUILabel.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end

@implementation ViewController {
    NSArray *tableData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tableData = [NSArray arrayWithObjects:@"Skrillex", @"Ravine", @"Diplo", nil];
    
//    BlurredUILabel *label = [[BlurredUILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 50)];
//    label.blurRadius = 2.0;
//    label.backgroundColor = [UIColor redColor];
//    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:35];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"HELLO";
//    [self.view addSubview:label];
//    
//    label.blurRadius = 1.5;
//    [label performSelector:@selector(setText:) withObject:@"Test new string" afterDelay:2];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    
//    CGRect textSize = CGRectMake(0, 0, 384, 59.5);
    
    BlurredUILabel *label = [[BlurredUILabel alloc] initWithFrame:cell.frame];
    label.font = cell.textLabel.font;
    label.blurRadius = 0.0;
    label.text = cell.textLabel.text;
//    [cell addSubview:label];
    [cell.textLabel addSubview:label];
    
    cell.backgroundColor = [UIColor blueColor];
    cell.textLabel.backgroundColor = [UIColor greenColor];


    
//    // Create blur effect
//    UIVisualEffect *effect = [UIBlurEffect effectWithStyle: UIBlurEffectStyleLight];
//    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:effect];
//    blurEffectView.frame = cell.frame;
//    [blurEffectView setFrame:cell.bounds];
////    blurEffectView.alpha = 0.9;
//    [cell addSubview:blurEffectView];

//    cell.textLabel.text = @"b";

    return cell;
}

@end