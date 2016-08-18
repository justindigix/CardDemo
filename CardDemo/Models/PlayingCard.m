//
//  PlayingCard.m
//  CardDemo
//
//  Created by Justin Zhang on 17.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;
@synthesize rank = _rank;

#pragma mark - Class Methods
/**
 *  Class Methods: define the valid suits
 *
 *  @return NSArray of valid suits
 */

+(NSArray *)validSuits{
    return @[@"♥︎",@"♦︎",@"♠︎",@"♣︎"];
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3", @"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank{
    return [[self rankStrings] count] - 1;
}

#pragma mark - Instance Methods
// @override
- (NSString *)contents{
    
    // NSArray *rankStrings = @[@"?",@"A",@"2",@"3", @"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"]; // use "?" as a placeholder for rankStrings[0]
    // return [NSString stringWithFormat:@"%lu%@", (unsigned long)self.rank, self.suit];
    return  [[PlayingCard rankStrings][self.rank] stringByAppendingString:self.suit];
}

#pragma mark - Override the setter getter
-(void)setSuit:(NSString *)aSuit{
    
    if ([[PlayingCard validSuits] containsObject:aSuit]) {
        _suit = aSuit;
    }
}

-(NSString *)suit{
    
    return _suit ? _suit:@"?";

}

-(void)setRank:(NSUInteger)aRank{
    if (aRank<=[PlayingCard maxRank]) {
        _rank= aRank;
    }
}



@end
