//
//  PlayingCardDeck.m
//  CardDemo
//
//  Created by Justin Zhang on 18.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

-(instancetype)init{
    self = [super init];
    
    if (self) {
        // the customized logic
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank<=[PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                // NSLog(@"card is generated: %@",[card contents]);
                [self addCard:card];
            }
        }
        
    }
    
    return self;
}

@end
