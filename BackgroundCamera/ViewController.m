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

@end

@implementation ViewController {
    NSArray *tableData;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    BlurText *custom = [[BlurText alloc] init];
    // assign delegate
    custom.delegate = self;
    [custom blurText];

    
    tableData = [NSArray arrayWithObjects:@"Skrillex", @"DJ Ravine", @"Diplo", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [tableData count];
}

// FIXME: Clicking on cells removes blur overlay

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    
    // call blur text?
    // Current text rect
    CGRect textSize = CGRectMake(0, 0, 384, 59.5);
    
    BlurredUILabel *label = [[BlurredUILabel alloc] initWithFrame:textSize];
    label.blurRadius = 5.0;
    // Helvetica Neue Light is default System font
    label.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:37];
    label.text = cell.textLabel.text;
    [cell.textLabel addSubview:label];

    cell.textLabel.text = @" ";

    return cell;
}

@end