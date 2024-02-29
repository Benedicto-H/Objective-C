//
//  Square.h
//  OOP
//
//  Created by 홍진표 on 2/29/24.
//

#import "Rectangle.h"

NS_ASSUME_NONNULL_BEGIN

@interface Square : Rectangle

//  Method
-(id)initWithWidth:(double)newWidth;

//  Factory Method
+(id)squareWithWidth:(double)newWidth;

@end

NS_ASSUME_NONNULL_END
