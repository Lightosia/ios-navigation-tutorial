//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "LetraBViewController.h"


@implementation LetraAViewController



-(void) viewDidLoad {
    [super viewDidLoad];
    self.title = @"A";
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIButton *botao = [UIButton
                       buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"Abra" forState:UIControlStateNormal];
    [botao sizeToFit];
    botao.center = self.view.center;
    [botao addTarget:self action:@selector(mostraImagem:) forControlEvents:UIControlEventAllTouchEvents];
    [self.view addSubview:botao];
    if([self.title isEqualToString:@"Z"]){
        
    }
 
}

-(void)next:(id)sender {
    char aux = [self.title characterAtIndex:0];
    aux = aux + 1;
    self.title=[NSString stringWithFormat:@"%c",aux];
    
    
}
-(void)mostraImagem:(id)sender{
    UIImage *imagem =[UIImage imageNamed:@"Abra.png"];
    UIImageView *imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(30, 40, 280, 280)];
    //  [self.view addSubview:imagem];
    imageHolder.image=imagem;
    [self.view addSubview:imageHolder];
}



@end
