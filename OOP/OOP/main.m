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
        Rectangle *rect = [Rectangle new];
        
        rect.width = 10;
        rect.height = 20;
        
        NSLog(@"[rect] width: %.1lf, height: %.1f", rect.width, rect.height);
        NSLog(@"[rect] getArea: %.1lf", [rect getArea]);
        NSLog(@"[rect] getAreaWithPropertyReadonly: %.1lf", rect.getAreaWithPropertyReadonly);
//        rect.getAreaWithProperty = 100.0;   //  ->  Compile error
    }
    return 0;
}
