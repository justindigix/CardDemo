//
//  Deck.m
//  CardDemo
//
//  Created by Justin Zhang on 17.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import "Deck.h"


// Deck private category
@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; // of Card

@end


@implementation Deck

-(NSMutableArray *)cards{
    //Lazy instantiation in getter method.
    
    if(!_cards) {
        
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    NSAssert(card, @"card is nil!");
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
    
}

-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}


-(Card *)drawRandomCard{
    // 1. init (Use a default value, normally a false/nil to ensure the output value)
    Card *randomCard = nil;
    // 2a. if card is not empty draw a random card
    if ([self.cards count]) {
        // 3. Get the random num
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        // Or use the methods below
        /* randomCard = [self.cards objectAtIndex:index];*/
        // 4. remove the card -- That's why we call draw card!
        [self.cards removeObjectAtIndex:index];
    }
    //2b. return nil if cards is empty
    return randomCard;
}

@end
