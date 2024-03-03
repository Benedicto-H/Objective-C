//
//  Song.h
//  OOP
//
//  Created by 홍진표 on 3/3/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Song : NSObject

@property (nonatomic, readwrite, retain) NSString *title;
@property (nonatomic, readwrite, retain) NSString *artist;
@property (nonatomic, readwrite, assign) int duration;

-(id)initWithTitle:(NSString *)title artist:(NSString *)artist;
-(void)play;

+(id)songWithTitle:(NSString *)title artist:(NSString *)artist;

@end

NS_ASSUME_NONNULL_END
