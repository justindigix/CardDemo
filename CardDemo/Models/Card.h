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

@property (nonatomic,assign) BOOL chosen;
@property (nonatomic,assign) BOOL matched;


-(int)match:(NSArray *)otherCards;

@end
