//
//  ViewController.m
//  CardDemo
//
//  Created by Justin Zhang on 17.08.16.
//  Copyright © 2016 Tutorials. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;

@property (nonatomic, assign) int flipCount;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/*
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
} */

// HERE BETTER NOT TO OVERRIDE THE SETTER:flipCount

-(void)updateFlipCount{
    if (self.flipCount>1) {
        self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    }else{
        self.flipsLabel.text = [NSString stringWithFormat:@"Flip: %d", self.flipCount];
    }
    NSLog(@"FlipCount: %d",self.flipCount);
    
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        [sender setTitle:@"A♣︎" forState:UIControlStateNormal];
    }
    self.flipCount++;
    [self updateFlipCount];
}


@end
