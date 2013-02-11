//
//  CCFTabStripViewController.m
//  CCFScrollingTabBar
//
//  Created by Duncan Alan on 3/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCFTabStripViewController.h"
#import "CCFScrollableTabView.h"

@interface CCFTabStripViewController ()

@property (nonatomic, strong) IBOutlet CCFScrollableTabView *tabStrip;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@end

@implementation CCFTabStripViewController

@synthesize tabStrip, tableView = _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabStrip.delegate = self;
    self.tabStrip.dataSource = self;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
	static NSString *cellIdentifier = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if( !cell )
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.textLabel.text = @"Something";
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath;
{
}


#pragma mark CCFScrollableTabViewDataSource

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
    return [NSArray arrayWithObjects:@"Afrikaans",@"Armenian",@"Anglo-Saxon",@"Burmese",@"Cantonese",@"Danish",@"English",@"French",@"German",@"Hungarian", nil];
}

#pragma mark - CCFScrollableTabViewDelegate

- (void)scrollableTabView:(CCFScrollableTabView *)tabView didSelectItemAtIndex:(NSInteger)index;
{
    NSLog(@"%s - SELECTED = %d",__FUNCTION__,index);
}

@end
