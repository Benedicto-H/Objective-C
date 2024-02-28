//
//  Rectangle.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import "Rectangle.h"

@implementation Rectangle

- (void) setWidth: (double)newWidth {
    width = newWidth;
}

-(double) width {
    return width;
}

- (void) setHeight: (double)newHeight {
    height = newHeight;
}

-(double) height {
    return height;
}

- (double) getArea {
    return width * height;
}

- (double)setWidth:(double)newWidth height:(double)newHeight {
//    width = newWidth;
//    height = newHeight;
    
    [self setWidth: newWidth];
    [self setHeight: newHeight];
    
    return [self getArea];
}

- (BOOL)isSquare {
    return width == height ? YES : NO;
}

@end
