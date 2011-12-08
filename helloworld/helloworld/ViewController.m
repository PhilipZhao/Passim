//
//  ViewController.m
//  helloworld
//
//  Created by Philip Zhao on 12/7/11.
//  Copyright (c) 2011 University of Wisconsin-Madison. All rights reserved.
//

#import "ViewController.h"
#import "HelloWorldBrain.h"

@interface ViewController()
@property (nonatomic) BOOL userIsInMiddleOfTyping;
@property (nonatomic, strong) HelloWorldBrain* brain;
@end

@implementation ViewController

@synthesize display = _display;
@synthesize userIsInMiddleOfTyping = _userIsInMiddleOfTyping;
@synthesize brain = _brain;

- (HelloWorldBrain*) brain {
  if (!_brain) {
    _brain = [[HelloWorldBrain alloc] init];
  }
  return _brain;
}
- (IBAction)digitPressed:(UIButton*) sender {
  NSString* value = sender.currentTitle;
  if (self.userIsInMiddleOfTyping) {
    self.display.text = [self.display.text stringByAppendingString:value];
  } else {
    self.display.text = value;
    self.userIsInMiddleOfTyping = YES;
  }
}

- (IBAction)enterPressed {
  [self.brain pushOperand: [self.display.text doubleValue]];
  self.userIsInMiddleOfTyping = NO;
}

- (IBAction)operandPressed:(UIButton*)sender {
  if (self.userIsInMiddleOfTyping) {
    [self enterPressed];
  }
  double result = [self.brain performOperation:sender.currentTitle];
  self.display.text = [NSString stringWithFormat:@"%g", result];
}



@end
