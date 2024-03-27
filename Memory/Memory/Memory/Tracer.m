//
//  Tracer.m
//  Memory
//
//  Created by 홍진표 on 3/9/24.
//

#import "Tracer.h"

@implementation Tracer

@synthesize name;

- (void)dealloc
{
    NSLog(@"%@ dealloc!", name);
}

@end
