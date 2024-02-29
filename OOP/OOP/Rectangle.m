//
//  Rectangle.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import "Rectangle.h"

@implementation Rectangle

- (id)init
{
    self = [super init];
    if (self) {
//        width = 10.0;
//        height = 20.0;
        
        [self setWidth:10.0];
        [self setHeight:20.0];
    }
    return self;
}

- (id)initWithWidth:(double)newWidth height:(double)newHeight
{
    self = [super init];
    if (self) {
        [self setWidth:newWidth];
        [self setHeight:newHeight];
    }
    return  self;
}

- (void)setWidth:(double)newWidth {
    width = newWidth;
}

-(double)width {
    return width;
}

- (void)setHeight:(double)newHeight {
    height = newHeight;
}

-(double)height {
    return height;
}

- (double)getArea {
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

+(id)rectangle {
    Rectangle *rectangle = [[Rectangle alloc] init];
    
    return rectangle;
}

+(id)rectangleWithWidth:(double)newWidth height:(double)newHeight {
    Rectangle *rectangle = [[Rectangle alloc] initWithWidth:newWidth height:newHeight];
    
    return rectangle;
}

@end
