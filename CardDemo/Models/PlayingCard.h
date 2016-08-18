//
//  PlayingCard.h
//  CardDemo
//
//  Created by Justin Zhang on 17.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

/**
 *  PlayingCard -- Subclass of Card
 */

@interface PlayingCard : Card

@property(strong, nonatomic) NSString *suit;
@property(assign,nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
