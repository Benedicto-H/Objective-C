//
//  Student.m
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/11/24.
//

#import "Student.h"

@implementation Student

- (void)study {
    NSLog(@"Do study");
}

@end

@implementation Student (Enrollment)

- (void)enroll {
    NSLog(@"Do enroll");
}

@end
