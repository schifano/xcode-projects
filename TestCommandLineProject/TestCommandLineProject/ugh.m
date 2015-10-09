//
//  ugh.m
//  TestCommandLineProject
//
//  Created by Rachel Schifano on 8/7/15.
//  Copyright (c) 2015 schifano. All rights reserved.
//

#import <Foundation/Foundation.h>

CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black

