###CCFScrollingTabBar###
==================

A refined scrolling tab bar for iPhone.

![CCFScrollingTabBar image](https://raw.github.com/cocoa-factory/CCFScrollingTabBar/screenshots/screenshots/tab-bar-img-001.jpg)

####Getting started####

To get started using CCFScrollingTabBar, download the source and checkout the sample project.  Here's what we did in the example:

- Created a new view controller + nib
- In the nib, create a view 41 pixels high, 320 pixels wide (spanning the iOs screen) and give it a custom class of `CCFScrollableTabView`
- In our custom view controller's `viewDidLoad` method, set the `delegate` and `dataSource` properties on the scrollable tab view to ourselves.
- Implement the data source methods:

```
#pragma mark - CCFScrollableTabViewDataSource


- (UIColor *)textColorInScrollableTabView:(CCFScrollableTabView *)tabView {
    return [UIColor whiteColor];
}

- (UIColor *)darkColorInScrollableTabView:(CCFScrollableTabView *)tabView {
    return [UIColor colorWithRed:0.0706f green:0.1529f blue:0.4235f alpha:1.0f];
}

- (UIColor *)lightColorInScrollableTabView:(CCFScrollableTabView *)tabView {
    return [UIColor colorWithRed:0.258f green:0.639f blue:0.890f alpha:1.0f];
}

- (NSArray *)titlesInScrollableTabView:(CCFScrollableTabView *)tabView {
    return [NSArray arrayWithObjects:@"Afrikaans",@"Basque",@"Catalan",@"Croatian",@"Danish",@"English",@"French",@"German",@"Hungarian", nil];
}
```

- Implement the following delegate method:

```
#pragma mark - CCFScrollableTabViewDelegate

- (void)scrollableTabView:(CCFScrollableTabView *)tabView didSelectItemAtIndex:(NSInteger)index;
{
    NSLog(@"%s - SELECTED = %d",__FUNCTION__,index);
    NSString *language = Languages[index];
    self.textLabel.text = LanguageTexts[language];
}
```

And that's it!
