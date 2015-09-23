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
    
    tableData = [NSArray arrayWithObjects:@"Skrillex", @"DJ Ravine", @"Diplo", nil];
    
    
//    BlurredUILabel *label = [[BlurredUILabel alloc] initWithFrame:CGRectMake(50, 50, 300, 50)];
//    label.blurRadius = 2.0;
//    label.backgroundColor = [UIColor redColor];
//    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:50];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.text = @"HELLO";
//    [self.view addSubview:label];
//    
//    label.blurRadius = 1.5;
//    [label performSelector:@selector(setText:) withObject:@"Test new string" afterDelay:2];
//
//    NSArray *fontFamilies = [UIFont familyNames];
//    
//    for (int i=0; i<[fontFamilies count]; i++)
//    {
//        NSLog(@"Font: %@ ...", [fontFamilies objectAtIndex:i]);
//    }
    
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
    
    CGRect textSize = CGRectMake(0, 0, 384, 59.5);
    
    BlurredUILabel *label = [[BlurredUILabel alloc] initWithFrame:textSize];
    label.blurRadius = 4.0;
//    label.font = [UIFont fontWithName:@"]cell.textLabel.font;
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:37];
    label.text = cell.textLabel.text;
//    label.textAlignment = NSTextAlignmentCenter;
    [cell.textLabel addSubview:label];
    
//    label.blurRadius = 1.5;
    
//    cell.backgroundColor = [UIColor blueColor];
//    cell.textLabel.backgroundColor = [UIColor greenColor];


    cell.textLabel.text = @" ";

    return cell;
}

@end