//
//  Card.m
//  CardDemo
//
//  Created by Justin Zhang on 17.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import "Card.h"

// the @interface below declear a category
@interface Card ()

@end

@implementation Card

@synthesize contents = _contents;
@synthesize chosen = _chosen;
@synthesize matched = _matched;

/* Actually we dont need to implement the geter and setter 
   the @property and @synthesize will generate the following methods automatically
 */

/* 
 -(NSString *)contents
{
    return _contents;
}

-(void)setContents:(NSString *)contents{
    _contents = contents;
} 
*/

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score++;
        }
    }
    
    return score;
}


@end
