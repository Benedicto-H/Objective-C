//
//  Rectangle.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import "Rectangle.h"

@implementation Rectangle

- (double)getArea {
//    return self.width * self.height;
    return _width * _height;
}

- (double)getAreaWithPropertyReadonly {
    return self.width * self.height;
}

- (void)setWidth:(double)width {
    if (width < 0) {
        _width = 0;
    } else {
        _width = width;
    }
}

@end
