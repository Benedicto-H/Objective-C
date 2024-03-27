//
//  Square.m
//  OOP
//
//  Created by 홍진표 on 2/29/24.
//

#import "Square.h"

@implementation Square

- (instancetype)init
{
    if (self) {
        self = [super init];
    }
    return self;
}

- (instancetype)initWithWidth:(double)newWidth {
    return [super initWithWidth:newWidth height:newWidth];
}

@end
