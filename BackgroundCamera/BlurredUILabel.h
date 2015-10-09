//
//  BlurredUILabel.h
//  BlurText
//
//  Created by Rachel Schifano on 9/21/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BlurredUILabel : UILabel

@property (nonatomic, readwrite) IBInspectable CGFloat blurRadius;

- (void)blurText;

@end