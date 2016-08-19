//
//  CardMatchingGame.h
//  CardDemo
//
//  Created by Justin Zhang on 18.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
@interface CardMatchingGame : NSObject


-(instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;
@property (assign,nonatomic, readonly) NSInteger score;

@end
