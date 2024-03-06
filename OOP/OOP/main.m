//
//  main.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>
#import "Rectangle/Rectangle.h"
#import "Square/Square.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        Rectangle *r1 = [[Rectangle alloc] initWithWidth:20.0 height:20.0];
        Rectangle *r2 = [[Rectangle alloc] initWithWidth:10.0 height:20.0];
        
        [r1 isEqual:r2] ? NSLog(@"r1 == r2") : NSLog(@"r1 != r2");
        [r1 isEqualToRect:r2] ? NSLog(@"r1 == r2") : NSLog(@"r1 != r2");
        
        Square *s1 = [[Square alloc] initWithWidth:20.0];
        
        [r1 isEqual:s1] ? NSLog(@"r1 == s1") : NSLog(@"r1 != s1");
        
        NSLog(@"r1: %@", r1);
        NSLog(@"r1: %@", [r1 description]);
    }
    return 0;
}
