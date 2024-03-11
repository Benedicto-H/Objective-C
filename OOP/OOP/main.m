//
//  main.m
//  OOP
//
//  Created by 홍진표 on 2/28/24.
//

#import <Foundation/Foundation.h>
#import "Album/Album.h"
#import "Song/Song.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        NSMutableArray *array = [NSMutableArray array];
        
        [array addObject:
         @{@"s1": @[
            [[Song alloc] initWithTitle:@"track1" artist:@"artist1"],
            [[Song alloc] initWithTitle:@"track2" artist:@"artist1"],
            [[Song alloc] initWithTitle:@"track3" artist:@"artist1"],
            [[Song alloc] initWithTitle:@"track4" artist:@"artist1"],
            [[Song alloc] initWithTitle:@"track5" artist:@"artist1"]
        ]}];
        [array addObject:
         @{@"s2": @[
            [[Song alloc] initWithTitle:@"track1" artist:@"artist2"],
            [[Song alloc] initWithTitle:@"track2" artist:@"artist2"],
            [[Song alloc] initWithTitle:@"track3" artist:@"artist2"]
        ]}];
        
        Album *album1 = [Album new];
        Album *album2 = [Album new];
        
        album1.title = @"1st Album";
        album2.title = @"2nd Album";
        
        for (NSDictionary *dict in array) {
            if ([[dict allKeys] containsObject:@"s1"]) {
                for (Song *song in [dict objectForKey:@"s1"]) {
                    [album1 addSong:song];
                }
            } else if ([[dict allKeys] containsObject:@"s2"]) {
                for (Song *song in [dict objectForKey:@"s2"]) {
                    [album2 addSong:song];
                }
            }
        }
        
        [album1 play];
        [album2 play];
        printf("\n");
        
        for (int i = 0; i <= [album1.songs count]; i++) {
            NSString *str = [NSString stringWithFormat:@"track[%d]", i];
            
            str = [str stringByReplacingOccurrencesOfString:@"[" withString:@""];
            str = [str stringByReplacingOccurrencesOfString:@"]" withString:@""];
            
            NSLog(@"(album1) songs.title: %@ \n(album1) songs.artist: %@", [[album1 searchSong:str] title], [[album1 searchSong:str] artist]);
        }
        printf("\n");
        
        [album1 deleteSong:@"track5"];
        
        for (int i = 0; i <= [album1.songs count]; i++) {
            NSString *str = [NSString stringWithFormat:@"track[%d]", i];
            
            str = [str stringByReplacingOccurrencesOfString:@"[" withString:@""];
            str = [str stringByReplacingOccurrencesOfString:@"]" withString:@""];
            
            NSLog(@"(album1) songs.title: %@ \n(album1) songs.artist: %@", [[album1 searchSong:str] title], [[album1 searchSong:str] artist]);
        }
        printf("\n");
        
        for (int i = 0; i <= [album2.songs count]; i++) {
            NSString *str = [NSString stringWithFormat:@"track[%d]", i];
            
            str = [str stringByReplacingOccurrencesOfString:@"[" withString:@""];
            str = [str stringByReplacingOccurrencesOfString:@"]" withString:@""];
            
            NSLog(@"(album2) songs.title: %@ \n(album2) songs.artist: %@", [[album1 searchSong:str] title], [[album1 searchSong:str] artist]);
        }
    }
    return 0;
}
