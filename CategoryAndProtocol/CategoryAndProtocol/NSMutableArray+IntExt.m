//
//  NSMutableArray+IntExt.m
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/11/24.
//

#import "NSMutableArray+IntExt.h"

@implementation NSMutableArray (IntExt)

- (void)addInt:(int)value {
    NSNumber *number = [[NSNumber alloc] initWithInt:value];
    
    [self addObject:number];
//    [self addObject:@(value)]
}

- (int)intAtIndex:(NSUInteger)index {
    NSNumber *number = self[index];
    return [number intValue];
}

@end
