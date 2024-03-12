//
//  NSMutableArray+IntExt.h
//  CategoryAndProtocol
//
//  Created by 홍진표 on 3/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (IntExt)

-(void)addInt:(int)value;
-(int)intAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
