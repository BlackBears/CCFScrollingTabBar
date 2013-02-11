//
//  CCFViewController.m
//  CCFScrollingTabBar
//
//  Created by Duncan Alan on 3/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCFViewController.h"
#import "CCFScrollableTab.h"
#import "CCFScrollableTabContentView.h"
#import "CCFScrollableTabStop.h"
#import "CCFScrollableTabScrollView.h"
#import "CCFScrollableTabView.h"

static NSDictionary *LanguageTexts;
static NSArray *Languages;


@interface CCFViewController ()

@end

@implementation CCFViewController

+ (void)initialize {
    if( self == [CCFViewController class] ) {
        Languages = [NSArray arrayWithObjects:@"Afrikaans",@"Basque",@"Catalan",@"Croatian",@"Danish",@"English",@"French",@"German",@"Hungarian", nil];
        LanguageTexts = @{@"Afrikaans" : @"Asseblief peuter nie met die vliegtuig rookverklikkers.",
                          @"Basque" : @"Mesedez, ez hegazkinaren Ke-detektagailuak manipulatzea.",
                          @"Catalan" :  @"Si us plau, no toqueu els detectors de fum de l'avioneta.",
                          @"Croatian" : @"Molimo ne petljati s detektorima dima zrakoplova.",
                          @"Danish" : @"Vær venlig ikke at pille ved flyets røgalarmer.",
                          @"English" : @"Please do not tamper with the aircraft smoke detectors",
                          @"French" : @"S'il vous plaît ne pas toucher aux détecteurs de fumée des avions",
                          @"German" : @"Bitte nicht mit den Flugzeugen Rauchmelder manipulieren",
                          @"Hungarian" : @"Kérjük, ne fogjon hozzá a légi füstérzékelőket." };
                          
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tabStrip.delegate = self;
    self.tabStrip.dataSource = self;
    
    [[self tabStrip] setSelectedItemIndex:0];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - CCFScrollableTabViewDataSource


- (UIColor *)textColorInScrollableTabView:(CCFScrollableTabView *)tabView;
{
    return [UIColor whiteColor];
}

- (UIColor *)darkColorInScrollableTabView:(CCFScrollableTabView *)tabView;
{
    return [UIColor colorWithRed:18.0f/255.0f green:39.0f/255.0f blue:108.0f/255.0f alpha:1.0f];
}

- (UIColor *)lightColorInScrollableTabView:(CCFScrollableTabView *)tabView;
{
    return [UIColor colorWithRed:0.258f green:0.639f blue:0.890f alpha:1.0f];
}

- (NSArray *)titlesInScrollableTabView:(CCFScrollableTabView *)tabView;
{
    return [NSArray arrayWithObjects:@"Afrikaans",@"Basque",@"Catalan",@"Croatian",@"Danish",@"English",@"French",@"German",@"Hungarian", nil];
}

#pragma mark - CCFScrollableTabViewDelegate

- (void)scrollableTabView:(CCFScrollableTabView *)tabView didSelectItemAtIndex:(NSInteger)index;
{
    NSLog(@"%s - SELECTED = %d",__FUNCTION__,index);
    NSString *language = Languages[index];
    self.textLabel.text = LanguageTexts[language];
}

@end
