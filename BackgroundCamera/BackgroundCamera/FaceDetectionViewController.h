//
//  FaceDetectionViewController
//  BackgroundCamera
//
//  Created by Rachel Schifano on 10/5/15.
//  Copyright © 2015 schifano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@class CIDetector;

@interface FaceDetectionViewController : UIViewController <UIGestureRecognizerDelegate, AVCaptureVideoDataOutputSampleBufferDelegate> {
    
    AVCaptureSession *session;
    AVCaptureVideoDataOutput *videoDataOutput;
    AVCaptureStillImageOutput *stillImageOutput;
    dispatch_queue_t videoDataOutputQueue;
    BOOL isUsingFrontFacingCamera;
    BOOL detectFaces;
    CIDetector *faceDetector;
}

@end