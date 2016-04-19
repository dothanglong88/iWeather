//
//  ViewController.m
//  iWeather
//
//  Created by Xmob - Longdt on 4/8/16.
//  Copyright © 2016 Xmob - Longdt. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *convertCF;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    float fTemperature;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ",@"Chớ thấy sóng cả mà ngã tay chèo",@"Có công mài sắt có ngày nên kim"];
    
    locations = @[@"Hà Nội, Việt Nam",@"Yên Bái",@"Hồ Chí Minh"];
    
    photoFiles = @[@"rain",@"thunder",@"windy",@"sunny"];
}

- (IBAction)convertWeather:(id)sender {
    NSString* oldtemp = [(UIButton *)sender currentTitle];
    NSLog(@"oldtemp %@", oldtemp);
    float foldtemp = [oldtemp floatValue];
    NSString* str = _convertCF.text;
    if ([str compare:@"C"]==NSOrderedSame){
        _convertCF.text = @"F";
        foldtemp = (9/(float)5) * foldtemp + 32;
        NSLog(@"newtempF %2.1f", foldtemp);
    }else{
        _convertCF.text = @"C";
        foldtemp = (5/(float)9) * (foldtemp - 32);
        NSLog(@"newtempC %2.1f", foldtemp);
    }
    NSString* s = [NSString stringWithFormat:@"%2.1f", foldtemp];
    [_temperature setTitle:s forState:UIControlStateNormal];
}

- (IBAction)updateWeather:(id)sender {
    _convertCF.text = @"C";
    int quoteIndex = arc4random_uniform(quotes.count);
    _quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    _location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    _weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    fTemperature = [self getTemperature];
    NSString* string = [NSString stringWithFormat:@"%2.1f", fTemperature];
    [_temperature setTitle:string forState:UIControlStateNormal];
}

- (float) getTemperature{
    return 13.0 + arc4random_uniform(18) + (float)arc4random()/(float)INT32_MAX;
}


@end
