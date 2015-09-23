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

- (void)setText:(NSString *)text {
    super.text = text;
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setDefaults];
    
    CIImage *imageToBlur = [CIImage imageWithCGImage:image.CGImage];
    CGRect originalSize = [imageToBlur extent];
    
    originalSize.origin.x = self.blurRadius;
    originalSize.origin.y = self.blurRadius;
    originalSize.size.width = originalSize.size.width - self.blurRadius * 2;
    originalSize.size.height = originalSize.size.height - self.blurRadius * 2;
    
//    CGRect imageSize = [imageToBlur extent];
    [blurFilter setValue:imageToBlur forKey:kCIInputImageKey];
    [blurFilter setValue:@(self.blurRadius) forKey:@"inputRadius"];
    
    CIImage *outputImage = blurFilter.outputImage;
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:outputImage fromRect:originalSize];
    
    [self.layer setContents:(__bridge id)cgimg];
    CGImageRelease(cgimg);
}

@end