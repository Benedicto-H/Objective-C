//
//  main.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"
#import "Square.h"
#import "Calculator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        /*
        Rectangle *rect = [[Rectangle alloc] init];
        [rect setWidth:10.0];
        [rect setHeight:10.0];
        
        NSLog(@"width: %.1f \nheight: %.1f \nget Area: %.1f", [rect width], [rect height], [rect getArea]);
        NSLog(@"is Square?: %d == %@", [rect isSquare], [rect isSquare] ? @"True" : @"False");
        
        NSLog(@"get Area: %.1f", [rect setWidth:10.0 height:20.0]);
        NSLog(@"is Square?: %d == %@", [rect isSquare], [rect isSquare] ? @"True" : @"False");
         */
        
        /*
        Square *square1 = [[Square alloc] init];
        [square1 setWidth:10.0];
        [square1 setHeight:10.0];
        
        NSLog(@"square1 area: %.1f", [square1 getArea]);
        
        Square *square2 = [[Square alloc] init];
        [square2 setWidth:100.0];
        
        NSLog(@"square2 area: %.1f", [square2 getArea]);
        
        Rectangle *rect = [[Square alloc] init];
        
        NSLog(@"isMemberOfClass: %@", [rect isMemberOfClass: [Square class]] ? @"True" : @"False");
        NSLog(@"isKindOfClass: %@", [rect isKindOfClass: [Square class]] ? @"True" : @"False");
         */
        
        /*
        Rectangle *defaultConstructorRect = [[Rectangle alloc] init];
        NSLog(@"rect area: %.1lf", [defaultConstructorRect getArea]);
        
        Rectangle *argsConstructorRect = [[Rectangle alloc] initWith:20.0 height:20.0];
        NSLog(@"rect area: %.1lf", [argsConstructorRect getArea]);
        
        Square *square = [[Square alloc] initWithWidth:50.0];
        NSLog(@"square area: %.1lf", [square getArea]);
         */
        
        /*
        Rectangle *factoryRect1 = [Rectangle rectangle];
        NSLog(@"factoryRect1 area: %.1lf", [factoryRect1 getArea]);
        
        Rectangle *factoryRect2 = [Rectangle rectangleWithWidth:30.0 height:50.0];
        NSLog(@"factoryRect2 area: %.1lf", [factoryRect2 getArea]);
        
        Square *factorySquare = [Square squareWithWidth:50];
        NSLog(@"factorySquare: %.1lf", [factorySquare getArea]);
         */
        
        /*
        Calculator *deskCalc = [Calculator new]; //  -> Calculator *deskCalc = [[Calculator alloc] init];
        
        [deskCalc setAccumulator:100.0];
        [deskCalc add:200.0];
        [deskCalc divide:15.0];
        [deskCalc subtract:10.0];
        [deskCalc multiply:5.0];
        
        NSLog(@"The result is %g", [deskCalc accumulator]);
         */
        
        NSString *str = @"Hello";
        
        SEL s = @selector(uppercaseString);
        NSString *res = [str performSelector:s];
        
        NSLog(@"res: %@", res);
    }
    return 0;
}
