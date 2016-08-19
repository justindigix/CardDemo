//
//  ViewController.m
//  CardDemo
//
//  Created by Justin Zhang on 17.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation ViewController
@synthesize deck = _deck;

-(CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}



-(Deck *)createDeck{
    
    return [[PlayingCardDeck alloc] init]; //Notice: here is downcasting. 
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/*
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} */

- (IBAction)touchCardButton:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];

}

-(void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", (int)self.game.score];
    
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChosen ? [card contents] : nil;
}

-(UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:(card.isChosen ? @"cardfront.png":@"cardback.png")];
}


@end
