//
//  Letras.m
//  Navigation
//
//  Created by Daniel Trevisan on 25/02/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Letras.h"

@implementation Letras
-(id)init{
    self=[super init];
    if(self){
        imagens = [NSArray alloc]initWithObjects:[UIImage ], nil]; // Implementar imagens depois
        letraimagem= [[NSDictionary alloc]initWithObjects:imagens forKeys:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",
        @"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    }
}

@end
