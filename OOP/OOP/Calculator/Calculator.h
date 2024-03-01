//
//  Calculator.h
//  OOP
//
//  Created by 홍진표 on 3/1/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Calculator : NSObject

//  Accumulator Methods
-(void)setAccumulator:(double)value;
-(void)clear;
-(double)accumulator;

//  Arithmetic Methods
-(void)add:(double)value;
-(void)subtract:(double)value;
-(void)multiply:(double)value;
-(void)divide:(double)value;

@end

NS_ASSUME_NONNULL_END
