//
//  CardMatchingGame.m
//  CardDemo
//
//  Created by Justin Zhang on 18.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import "CardMatchingGame.h"
// #define MISMATCH_PENALTY 2   //macro

@interface CardMatchingGame ()
@property (assign,nonatomic, readwrite) NSInteger score; //private
@property (strong,nonatomic) NSMutableArray *cards; // of Card
@property (strong,nonatomic) NSMutableArray *chosenCards;
@end


@implementation CardMatchingGame

static const int NUM_OF_CARDS_FOR_MATCHING = 4;
static const int MISMATCH_PENALTY = 2; //static constants
static const int MATCH_BOUNUS = 4;
static const int COST_OF_CHOOSING = 1;

-(NSMutableArray *)cards{
    // lazy instantiation when call getter.
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(NSMutableArray *)chosenCards{
    if (!_chosenCards) {
        _chosenCards = [[NSMutableArray alloc] initWithCapacity:NUM_OF_CARDS_FOR_MATCHING-1];
    }
    return _chosenCards;
}

-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) { // is card nil
                /* self.cards[i]=card; // NOT WELL PROGRAMED!
                 [self.cards insertObject:card atIndex:i]; // equal to the syntax above, this will cause the problemm when the index is not set correctly. */
                [self.cards addObject:card];    // right way!
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}


/* -(void)chooseCardAtIndex:(NSUInteger)index{
    
    Card *card = [self cardAtIndex:index];
    
    if(!card.isMatched){
        if(card.isChosen){
            card.chosen= NO;
            // if choose the card with status : isChosen,set it as not chosen
        }else{
            // match against other card
            for(Card *otherCard in self.cards){
                if(otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) { // if matched
                        self.score +=matchScore * MATCH_BOUNUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO; // reset
                    }
                    break;
                    
                }
            }
            self.score -= COST_OF_CHOOSING;
            card.chosen = YES;
        }
    }
    
} */

-(void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    int matchScore = 0;
    if (!card.isMatched) {
        if(card.isChosen){
            card.chosen = NO;
            if ([self.chosenCards containsObject:card]) {
                [self.chosenCards removeObject:card];
            }
        }else {
            if (![self.chosenCards count]) {
                //first card
                card.chosen = YES;
                [self.chosenCards addObject:card];
            }else{
                matchScore = [card match:self.chosenCards];
                if (matchScore) {
                    if ([self.chosenCards count] == 1) {
                        Card *otherCard = [self.chosenCards firstObject];
                        otherCard.matched = YES;
                    }
                    card.matched = YES;
                    card.chosen = YES;
                    [self.chosenCards addObject:card];
                    if (!([self.chosenCards count]<NUM_OF_CARDS_FOR_MATCHING)) {
                        self.score += matchScore * MATCH_BOUNUS;
                        [self.chosenCards removeAllObjects];
                    }
                }else{
                    self.score -= MISMATCH_PENALTY;
                    if ([self.chosenCards count] == 1) {
                        card.chosen = NO;
                    }
                    for (Card* chosenCard in self.chosenCards) {
                        chosenCard.chosen = NO;
                        chosenCard.matched = NO;
                    }
                    [self.chosenCards removeAllObjects]; // reset
                }
                
            }
            self.score -= COST_OF_CHOOSING;
            NSLog(@"score now is: %d", (int)self.score);
        }
        
        }
        
    }


-(Card *)cardAtIndex:(NSUInteger)index{
    Card *card =nil;
    if (index < self.cards.count) {
        card = self.cards[index];
    }
    return card;
}

@end
