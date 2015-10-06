//
//  ViewController.m
//  BackgroundCamera
//
//  Created by Rachel Schifano on 10/5/15.
//  Copyright © 2015 schifano. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreImage/CoreImage.h>
#import <ImageIO/ImageIO.h>
#import <AssertMacros.h>

// used for KVO observation of the @"capturingStillImage" property to perform flash bulb animation
static const NSString *AVCaptureStillImageIsCapturingStillImageContext = @"AVCaptureStillImageIsCapturingStillImageContext";

@interface ViewController ()

@end

@implementation ViewController


/// Method that sets up AVCapture.
- (void)setupAVCapture {
    NSError *error = nil;
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    // Select video device
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    // Error handling
    isUsingFrontFacingCamera = NO;
    if ( [session canAddInput:deviceInput] )
        [session addInput:deviceInput];
    
    // Make a still image output
    stillImageOutput = [AVCaptureStillImageOutput new];
    [stillImageOutput addObserver:self forKeyPath:@"capturingStillImage" options:NSKeyValueObservingOptionNew context:(__bridge void * _Nullable)(AVCaptureStillImageIsCapturingStillImageContext)];
    if ( [session canAddOutput:stillImageOutput] )
        [session addOutput:stillImageOutput];
    
    // Make a video data output
    videoDataOutput = [AVCaptureVideoDataOutput new];
    
    // we want BGRA, both CoreGraphics and OpenGL work well with 'BGRA'
    NSDictionary *rgbOutputSettings = [NSDictionary dictionaryWithObject:
                                       [NSNumber numberWithInt:kCMPixelFormat_32BGRA] forKey:(id)kCVPixelBufferPixelFormatTypeKey];
    [videoDataOutput setVideoSettings:rgbOutputSettings];
    [videoDataOutput setAlwaysDiscardsLateVideoFrames:YES]; // discard if the data output queue is blocked (as we process the still image)
    
    // create a serial dispatch queue used for the sample buffer delegate as well as when a still image is captured
    // a serial dispatch queue must be used to guarantee that video frames will be delivered in order
    // see the header doc for setSampleBufferDelegate:queue: for more information
    videoDataOutputQueue = dispatch_queue_create("VideoDataOutputQueue", DISPATCH_QUEUE_SERIAL);
    [videoDataOutput setSampleBufferDelegate:self queue:videoDataOutputQueue];
    
    if ( [session canAddOutput:videoDataOutput] )
        [session addOutput:videoDataOutput];
    [[videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:NO];

    
    [session startRunning];
    
bail:
    if (error) {
        // FIXME: Remove UIAlertView
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Uh oh"
                                                       message:@"Failed with error"
                                                       preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        [self teardownAVCapture];
    }
}

// clean up capture setup
- (void)teardownAVCapture
{
    [stillImageOutput removeObserver:self forKeyPath:@"isCapturingStillImage"];
}

- (void)toggleFaceDetection:(id)sender {
    detectFaces = [(UISwitch *) sender isOn];
    [[videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:detectFaces];
    if (!detectFaces) {
        // Toggle blur off
    }
}

@end


//An instance of AVCaptureDevice to represent the input device, such as a camera or microphone
//An instance of a concrete subclass of AVCaptureInput to configure the ports from the input device
//An instance of a concrete subclass of AVCaptureOutput to manage the output to a movie file or still image
//An instance of AVCaptureSession to coordinate the data flow from the input to the output