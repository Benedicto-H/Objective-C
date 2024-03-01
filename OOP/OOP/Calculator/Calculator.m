//
//  Calculator.m
//  OOP
//
//  Created by 홍진표 on 3/1/24.
//

#import "Calculator.h"

@implementation Calculator {
    
    //  Member Field
    double accumulator;
}

//  Accumulator Methods
- (void)setAccumulator:(double)value {
    accumulator = value;
}

- (void)clear {
    accumulator = 0;
}

- (double)accumulator {
    return accumulator;
}

//  Arithmetic Methods
- (void)add:(double)value {
    accumulator += value;
}

- (void)subtract:(double)value {
    accumulator -= value;
}

- (void)multiply:(double)value {
    accumulator *= value;
}

- (void)divide:(double)value {
    accumulator /= value;
}

@end
