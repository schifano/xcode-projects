//
//  ViewController.m
//  FacialDetection
//
//  Created by Rachel Schifano on 10/1/15.
//  Copyright © 2015 schifano. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"/Users/schifano/xcode-projects/FacialDetection/FacialDetection/steves.jpg"]];
    [imageView setTransform:CGAffineTransformMakeScale(1, -1)];
    [self.view setTransform:CGAffineTransformMakeScale(1, -1)];
    [imageView setFrame:CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height)];
    [self.view addSubview:imageView];
    
    CIImage* image = [CIImage imageWithCGImage:imageView.image.CGImage];
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy]];
    
    NSArray* features = [detector featuresInImage:image];
    
    for(CIFaceFeature* feature in features)
    {
        UIView* face = [[UIView alloc] initWithFrame:feature.bounds];
        [face setBackgroundColor:[[UIColor yellowColor] colorWithAlphaComponent:0.4]];
        [self.view addSubview:face];
        
        if(feature.hasLeftEyePosition)
        {
            UIView* eye = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            [eye setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.2]];
            [eye setCenter:feature.leftEyePosition];
            [self.view addSubview:eye];
        }
        
        if(feature.hasRightEyePosition)
        {
            UIView* eye = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            [eye setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.2]];
            [eye setCenter:feature.rightEyePosition];
            [self.view addSubview:eye];
        }
        
        if(feature.hasMouthPosition)
        {
            UIView* mouth = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            [mouth setBackgroundColor:[[UIColor greenColor] colorWithAlphaComponent:0.2]];
            [mouth setCenter:feature.mouthPosition];
            [self.view addSubview:mouth];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
