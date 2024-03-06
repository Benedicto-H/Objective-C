//
//  Rectangle.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import "Rectangle.h"

@implementation Rectangle

@synthesize width, height;

- (instancetype)init
{
    if (self = [super init]) {
        width = 0.0;
        height = 0.0;
    }
    return self;
}

- (instancetype)initWithWidth:(double)newWidth height:(double)newHeight {
    if (self = [super init]) {
        width = newWidth;
        height = newWidth;
    }
    return self;
}

- (double)getArea {
    return width * height;
}

- (BOOL)isSquare {
    return width == height;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[Rectangle class]]) {
        /*
        //  Type-casting
        Rectangle *rect = (Rectangle *)object;
        
        return (width == rect.width) && (height == rect.height);
         */
        
        return [self isEqualToRect:object];
    }
    
    return NO;
}

- (BOOL)isEqualToRect:(Rectangle *)rect {
    return (width == rect.width) && (height == rect.height);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"Rectangle: %p \nWidth: %.1lf \nHeight: %.1lf", self, width, height];
}

@end
