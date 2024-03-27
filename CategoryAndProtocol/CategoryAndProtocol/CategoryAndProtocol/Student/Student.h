//
//  Student.h
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject

-(void)study;

@end

@interface Student (Enrollment)

-(void)enroll;

@end

NS_ASSUME_NONNULL_END
