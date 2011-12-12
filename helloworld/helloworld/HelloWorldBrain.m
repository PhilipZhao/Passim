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
@property (nonatomic, strong) NSMutableArray* operationStack;
@end
@implementation HelloWorldBrain
@synthesize operandStack = _operandStack;
@synthesize operationStack = _operationStack;

-(NSMutableArray*) operandStack {
  if (_operandStack == nil) {
    _operandStack = [[NSMutableArray alloc] init];
  }
  return _operandStack;
}

-(NSMutableArray*) operationStack {
  if (_operationStack == nil) {
    _operationStack = [[NSMutableArray alloc] init];
  }
  return _operationStack;
}

-(double) popOperand {
  NSNumber* num = [self.operandStack lastObject];
  if (num) {
    [self.operandStack removeLastObject];
  } else {
    // set the default value to be 0
    num = [NSNumber numberWithInt:0];
  }
  return [num doubleValue];
}

-(NSString*) popOperation {
  NSString* operation = [self.operationStack lastObject];
  if (operation) {
    [self.operationStack removeLastObject];
  }
  return operation;
}

-(void) pushOperand:(double)operand {
  [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(void) pushOperation:(NSString *)operation {
  [self.operationStack addObject:operation];
}

-(double) performOperation {
  NSLog(@"Hello World");
  double result = 0;
  NSString* operation = [self popOperation];
  if ([operation isEqualToString:@"+"]) {
    result = [self popOperand] + [self popOperand];
  } else if ([operation isEqualToString:@"-"]) {
    
  } else if ([operation isEqualToString:@"x"]) {
    
  } else if ([operation isEqualToString:@"/"]) {
    
  } else if ([operation isEqualToString:@"+/-"]) {
    result = -[self popOperand];
  } else if ([operation isEqualToString:@"Sqrt"]) {
    result = [self popOperand];
    if (result >= 0) {
      result = sqrt(result);
    } else {
      // throw exception
    }
  } else if (!operation) {
    result = [self popOperand];
  }
  return result;
}

-(void) reset {
  // clear up the array
  [self.operationStack removeAllObjects];
  [self.operandStack removeAllObjects];
}
@end
