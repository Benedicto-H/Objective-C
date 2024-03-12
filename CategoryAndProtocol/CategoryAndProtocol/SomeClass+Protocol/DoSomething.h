//
//  DoSomething.h
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DoSomething <NSObject>

@property (nonatomic, assign) int number;
@property (nonatomic, strong) NSString *str;

-(void)doSomethingMethod;

@end

NS_ASSUME_NONNULL_END
