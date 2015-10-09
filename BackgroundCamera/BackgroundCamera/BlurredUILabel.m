//
//  BlurredUILabel.m
//  BlurText
//
//  Created by Rachel Schifano on 9/21/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlurredUILabel.h"

@implementation BlurredUILabel

- (void)blurText {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setDefaults];
    
    CIImage *imageToBlur = [CIImage imageWithCGImage:image.CGImage];
    [blurFilter setValue:imageToBlur forKey:kCIInputImageKey];
    [blurFilter setValue:@(self.blurRadius) forKey:@"inputRadius"];
    
    CIImage *outputImage = blurFilter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[imageToBlur extent]];
    
    [self.layer setContents:(__bridge id)cgimg];
    CGImageRelease(cgimg);
}

@end



//- (void)layoutSubviews {
//    [super layoutSubviews];
////    UIGraphicsBeginImageContext(self.bounds.size);
////    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
////    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
////    UIGraphicsEndImageContext();
////
////    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
////    [blurFilter setDefaults];
////
////    CIImage *imageToBlur = [CIImage imageWithCGImage:image.CGImage];
////    [blurFilter setValue:imageToBlur forKey:kCIInputImageKey];
////    [blurFilter setValue:@(self.blurRadius) forKey:@"inputRadius"];
////
////    CIImage *outputImage = blurFilter.outputImage;
////    CIContext *context = [CIContext contextWithOptions:nil];
////    CGImageRef cgimg = [context createCGImage:outputImage fromRect:[imageToBlur extent]];
////
////    [self.layer setContents:(__bridge id)cgimg];
////    CGImageRelease(cgimg);
//}
