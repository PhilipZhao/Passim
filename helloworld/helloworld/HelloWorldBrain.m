//
//  HelloWorldBrain.m
//  helloworld
//
//  Created by Philip Zhao on 12/8/11.
//  Copyright (c) 2011 University of Wisconsin-Madison. All rights reserved.
//

#import "HelloWorldBrain.h"
@interface HelloWorldBrain() 
@property (nonatomic, strong) NSMutableArray* operandStack;
@end
@implementation HelloWorldBrain
@synthesize operandStack = _operandStack;

-(NSMutableArray*) operandStack {
  if (_operandStack == nil) {
    _operandStack = [[NSMutableArray alloc] init];
  }
  return _operandStack;
}
-(double) popOperand {
  NSNumber* num = [self.operandStack lastObject];
  if (num) {
    [self.operandStack removeLastObject];
  }
  return [num doubleValue];
}

-(void) pushOperand:(double)operand {
  [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double) performOperation:(NSString *)operation {
  double result = 0;
  if ([operation isEqualToString:@"+"]) {
    result = [self popOperand] + [self popOperand];
  } else if ([operation isEqualToString:@"*"]) {
    result = [self popOperand] * [self popOperand];
  } else if ([operation isEqualToString:@"-"]) {
    double subValue = [self popOperand];
    result = [self popOperand] - subValue;
  } else if ([operation isEqualToString:@"/"]) {
    double divisor = [self popOperand];
    if (divisor) {
      result = [self popOperand] / divisor;
    }
  }
  [self pushOperand:result];
  
  return result;
}

@end
