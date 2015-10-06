//
//  ViewController.h
//  BackgroundCamera
//
//  Created by Rachel Schifano on 10/5/15.
//  Copyright © 2015 schifano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate, AVCaptureAudioDataOutputSampleBufferDelegate> {
    
    AVCaptureVideoDataOutput *videoDataOutput;
    AVCaptureStillImageOutput *stillImageOutput;
    dispatch_queue_t videoDataOutputQueue;
    BOOL detectFaces;
    BOOL isUsingFrontFacingCamera;
}


@end

