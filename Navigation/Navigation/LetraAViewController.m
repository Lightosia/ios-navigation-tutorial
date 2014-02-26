//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import <AVFoundation/AVFoundation.h>


@implementation LetraAViewController
@synthesize index;


-(void) viewDidLoad {
    [super viewDidLoad];
    _listaTela = [[NSMutableArray alloc]init];
    _letraChars = [@"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" componentsSeparatedByString:@","];
    _pokeLista = [@"Abra,Bulbasaur,Cyndaquil,Dratini,Eevee,Finneon,Goomy,Horsea,Inkay,Joltik,Koffing,Larvitar,Mareep,Numel,Omanyte,Pikachu,Quagsire,Ralts,Squirtle,Togepi,Umbreon,Vanillite,Whismur,Xatu,Yanma,Zorua" componentsSeparatedByString:@","];
    _pokeImagens= [@"Abra.png,Bulbasaur.png,Cyndaquil.jpg,Dratini.png,Eevee.png,Finneon.png,Goomy.png,Horsea.png,Inkay.jpg,Joltik.png,Koffing.png,Larvitar.png,Mareep.png,Numel.png,Omanyte.png,Pikachu.png,Quagsire.png,Ralts.png,Squirtle.png,Togepi.png,Umbreon.png,Vanillite.png,Whismur.png,Xatu.png,Yanma.png,Zorua.png" componentsSeparatedByString:@","];
    [self criarTelas];
    _imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(30, 80, 280, 280)];
    self.title = @"A";
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    UIBarButtonItem *ant = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=ant;
    _but = [UIButton
                       buttonWithType:UIButtonTypeSystem];
    [_but setTitle:@"Abra" forState:UIControlStateNormal];
    [_but sizeToFit];
    CGRect frame = _but.frame;
    frame.origin.x=130;
    frame.origin.y=400;
    _but.frame=frame;
    [_but addTarget:self action:@selector(mostraImagem:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_but];
    
 
}
-(void)criarTelas{
    index = 0;
    int aux = 0;
    UIView *tela = [[UIView alloc]init];
    while([_listaTela count]<27){
        [_listaTela insertObject:tela atIndex:aux];
        aux++;
    }
}

-(void)next:(id)sender {
    [_imageHolder removeFromSuperview];
    index++;
    if(index >25)
        index=0;
    self.view = (UIView *)[_listaTela objectAtIndex:index];
    self.title = _letraChars[index];
    [self.view addSubview:_but];
    [_but setTitle:_pokeLista[index] forState:UIControlStateNormal];
    [_but sizeToFit];
    
    
}
-(void)back:(id)sender {
    [_imageHolder removeFromSuperview];
    index--;
    if(index <0)
        index=25;
    self.view = (UIView *)[_listaTela objectAtIndex:index];
    self.title = _letraChars[index];
    [self.view addSubview:_but];
    [_but setTitle:_pokeLista[index] forState:UIControlStateNormal];
    [_but sizeToFit];
    

    
    
}
-(void)mostraImagem:(id)sender{
    _imagemPoke=[UIImage imageNamed:[_pokeImagens objectAtIndex:index]];
    AVSpeechSynthesisVoice *fala = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    AVSpeechUtterance *frase = [[AVSpeechUtterance alloc]initWithString:[_pokeLista objectAtIndex:index]];
    frase.rate = AVSpeechUtteranceMinimumSpeechRate;
    AVSpeechSynthesizer *speechsynt = [[AVSpeechSynthesizer alloc]init];
    [frase setVoice:fala];
    [speechsynt speakUtterance:frase];
    
    
    _imageHolder.image=_imagemPoke;
    [self.view addSubview:_imageHolder];
}



@end
