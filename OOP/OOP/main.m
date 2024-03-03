//
//  main.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>
#import "Song/Song.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        //  Create instance
        //  case1. with Default constructor
        Song *song1 = [Song new];   //  -> Song *song1 = [[Song alloc] init];
        song1.title = @"song1_Title";
        song1.artist = @"song1_Artist";
        song1.duration = 10;
        
        [song1 play];
        
        //  case2. with Arguments constructor
        Song *song2 = [[Song alloc] initWithTitle:@"song2_Title" artist:@"song2_Artist"];
        
        [song2 play];
        
        //  case3. with Factory method pattern
        Song *song3 = [Song songWithTitle:@"song3_Title" artist:@"song3_Artist"];
        
        [song3 play];
    }
    return 0;
}
