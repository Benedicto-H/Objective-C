//
//  Rectangle.h
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : NSObject

@property (nonatomic, assign) double width, height;

-(instancetype)init;
-(instancetype)initWithWidth:(double)newWidth height:(double)newHeight;

-(double)getArea;
-(BOOL)isSquare;
-(BOOL)isEqual:(id)object;
-(BOOL)isEqualToRect:(Rectangle *)rect;
-(NSString *)description;

@end

NS_ASSUME_NONNULL_END
    
