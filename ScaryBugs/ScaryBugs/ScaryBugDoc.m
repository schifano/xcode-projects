//
//  ScaryBugDoc.m
//  ScaryBugs
//
//  Created by Rachel Schifano on 1/4/15.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

#import "ScaryBugDoc.h"
#import "ScaryBugData.h"

@implementation ScaryBugDoc

@synthesize data = _data; // requires ScaryBugData.h
@synthesize thumbImage = _thumbImage;
@synthesize fullImage = _fullImage;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage*)thumbImage fullImage:(UIImage*)fullImage {
    if ((self = [super init])) {
        self.data = [[ScaryBugData alloc] initWithTitle:title rating:rating];
        self.thumbImage = _thumbImage;
        self.fullImage = _fullImage;
    }
    return self;
}

@end




