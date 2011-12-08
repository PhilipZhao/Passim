//
//  HelloWorldBrain.h
//  helloworld
//
//  Created by Philip Zhao on 12/8/11.
//  Copyright (c) 2011 University of Wisconsin-Madison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HelloWorldBrain : NSObject

-(void) pushOperand:(double) operand;

-(double) performOperation:(NSString*) operation;

@end
