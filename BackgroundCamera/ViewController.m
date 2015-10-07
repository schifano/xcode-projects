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

@interface ViewController ()

@end

@implementation ViewController

- (void)setupAVCapture {
    NSError *error = nil;
    
    session = [[AVCaptureSession alloc] init];
//    AVCaptureDevicePosition position = AVCaptureDevicePositionFront;
    AVCaptureDevice *device = [self frontCamera]; // automatically turn it on?
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];

    if (!error) {
        if ([session canAddInput:deviceInput]) {
            [session addInput:deviceInput];
        }
        
        NSLog(@"Inside !error"); // TEST
        
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
        
        if ([session canAddOutput:videoDataOutput]) {
            [session addOutput:videoDataOutput];
        }
        [[videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:YES];

        [session startRunning];
    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Uh oh"
                                                       message:@"Failed with error"
                                                       preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    
    // get the image
    CVPixelBufferRef pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    CFDictionaryRef attachments = CMCopyDictionaryOfAttachments(kCFAllocatorDefault, sampleBuffer, kCMAttachmentMode_ShouldPropagate);
    CIImage *ciImage = [[CIImage alloc] initWithCVPixelBuffer:pixelBuffer
                                                      options:(__bridge NSDictionary *)attachments];
    if (attachments) {
        CFRelease(attachments);
    }
    
//    // make sure your device orientation is not locked.
//    UIDeviceOrientation curDeviceOrientation = [[UIDevice currentDevice] orientation];
    
    NSDictionary *imageOptions = nil;
    
    NSArray *features = [faceDetector featuresInImage:ciImage options:imageOptions];
    
    NSLog(@"HELLO I'M IN CAPTUREOUTPUT"); // TEST
    NSLog(@"%@", features); // TEST
}

- (AVCaptureDevice *)frontCamera {
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if ([device position] == AVCaptureDevicePositionFront) {
            NSLog(@"device: %@", device);
            return device;
        }
    }
    return nil;
}

- (void)toggleFaceDetection {
    
    [[videoDataOutput connectionWithMediaType:AVMediaTypeVideo] setEnabled:YES];
    if (!detectFaces) {
        // Toggle blur off
    }
}

#pragma mark- View Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAVCapture];
    
    // Face Detection
    NSDictionary *detectorOptions = [[NSDictionary alloc] initWithObjectsAndKeys:CIDetectorAccuracyLow, CIDetectorAccuracy, nil];
    faceDetector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:detectorOptions];
}

@end


//An instance of AVCaptureDevice to represent the input device, such as a camera or microphone
//An instance of a concrete subclass of AVCaptureInput to configure the ports from the input device
//An instance of a concrete subclass of AVCaptureOutput to manage the output to a movie file or still image
//An instance of AVCaptureSession to coordinate the data flow from the input to the output