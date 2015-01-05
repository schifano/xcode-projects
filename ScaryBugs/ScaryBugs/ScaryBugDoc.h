//
//  ScaryBugDoc.h
//  ScaryBugs
//
//  Created by Rachel Schifano on 1/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ScaryBugData; // Forward declaration for this object

@interface ScaryBugDoc : NSObject

@property (strong) ScaryBugData *data;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage*)thumbImage fullImage:(UIImage*)fullImage;

@end