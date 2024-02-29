//
//  Square.m
//  OOP
//
//  Created by 홍진표 on 2/29/24.
//

#import "Square.h"

@implementation Square

- (id)initWithWidth:(double)newWidth
{
//    self = [super init];
//    if (self) {
//        [super setWidth:newWidth];
//        [super setHeight:newWidth];
//    }
//    return self;
    
    return [super initWithWidth:newWidth height:newWidth];
}

- (void)setWidth:(double)newWidth {
    [super setWidth: newWidth];
    [super setHeight: newWidth];
}

+ (id)squareWithWidth:(double)newWidth {
    Square *square = [[Square alloc] initWithWidth:newWidth];
    
    return square;
}

@end
