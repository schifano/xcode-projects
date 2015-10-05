//
//  AppDelegate.m
//  FacialDetection
//
//  Created by Rachel Schifano on 10/1/15.
//  Copyright © 2015 schifano. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreImage/CoreImage.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"steves.jpg"]];
    [imageView setTransform:CGAffineTransformMakeScale(1, -1)];
    [self.window setTransform:CGAffineTransformMakeScale(1, -1)];
    [imageView setFrame:CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height)];
    [self.window addSubview:imageView];
    
    CIImage* image = [CIImage imageWithCGImage:imageView.image.CGImage];
    CIDetector* detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:[NSDictionary dictionaryWithObject:CIDetectorAccuracyHigh forKey:CIDetectorAccuracy]];
    
    NSArray* features = [detector featuresInImage:image];
    
    
    for(CIFaceFeature* feature in features)
    {
        UIView* face = [[UIView alloc] initWithFrame:feature.bounds];
        [face setBackgroundColor:[[UIColor yellowColor] colorWithAlphaComponent:0.4]];
        [self.window addSubview:face];
        
        if(feature.hasLeftEyePosition)
        {
            UIView* eye = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            [eye setBackgroundColor:[[UIColor blueColor] colorWithAlphaComponent:0.2]];
            [eye setCenter:feature.leftEyePosition];
            [self.window addSubview:eye];
        }
        
        if(feature.hasRightEyePosition)
        {
            UIView* eye = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            [eye setBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.2]];
            [eye setCenter:feature.rightEyePosition];
            [self.window addSubview:eye];
        }
        
        if(feature.hasMouthPosition)
        {
            UIView* mouth = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 15)];
            [mouth setBackgroundColor:[[UIColor greenColor] colorWithAlphaComponent:0.2]];
            [mouth setCenter:feature.mouthPosition];
            [self.window addSubview:mouth];
        }
    }
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
