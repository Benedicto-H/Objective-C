//
//  Rectangle.h
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Rectangle : NSObject {
    
    double width;
    double height;
}

-(void) setWidth: (double)newWidth;   //  Setter
-(double) width;    //  Getter

-(void) setHeight: (double)newHeight;
-(double) height;

-(double) getArea;

-(double) setWidth: (double)newWidth height: (double)newHeight;

-(BOOL) isSquare;

@end

NS_ASSUME_NONNULL_END
