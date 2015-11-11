//
//  BlurText.h
//  BackgroundCamera
//
//  Created by Rachel Schifano on 10/9/15.
//  Copyright © 2015 schifano. All rights reserved.
//

// Declare class
@class BlurText;

// Define the protocol for the delegate
@protocol BlurTextDelegate

// Define protocol functions that can be used in any class using this delegate
//-(void)detectFaces;

@end

@interface BlurText: NSObject {
    
}

// Define delegate property
@property (nonatomic, assign) id delegate;

// Define public functions
-(void)blurText;

@end