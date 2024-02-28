//
//  main.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        Rectangle *rect = [[Rectangle alloc] init];
        [rect setWidth: 10.0];
        [rect setHeight: 10.0];
        
        NSLog(@"width: %.1f \nheight: %.1f \nget Area: %.1f", [rect width], [rect height], [rect getArea]);
        NSLog(@"is Square?: %d == %@", [rect isSquare], [rect isSquare] ? @"True" : @"False");
        
        NSLog(@"get Area: %.1f", [rect setWidth: 10.0 height: 20.0]);
        NSLog(@"is Square?: %d == %@", [rect isSquare], [rect isSquare] ? @"True" : @"False");
    }
    return 0;
}
