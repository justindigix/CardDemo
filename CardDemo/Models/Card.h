//
//  Card.h
//  CardDemo
//
//  Created by Justin Zhang on 17.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic,strong) NSString *contents;

@property (nonatomic,getter=isChosen,assign) BOOL chosen;
@property (nonatomic,getter=isMatched,assign) BOOL matched;


-(int)match:(NSArray *)otherCards;

@end
