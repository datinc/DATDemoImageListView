//
//  ViewController.m
//  DATDemoImageListView
//
//  Created by DATinc on 2016-10-24.
//  Copyright © 2016 DATinc. All rights reserved.
//

#import "ViewController.h"
#import "DATDemoImageListView.h"

@interface ViewController ()
@property (nonatomic, strong) UIStackView *stackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stackView = [UIStackView new];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.spacing = 0;
    [self.view addSubview:self.stackView];
    
    UILabel* topLabel = [UILabel new];
    topLabel.text = @"Top Label.\nNotice how this label can go on multiple lines and the stack view sizes the height dynamically.";
    topLabel.numberOfLines = 0;
    topLabel.backgroundColor = [UIColor redColor];
    [self.stackView addArrangedSubview:topLabel];
    
    NSMutableArray* images = [NSMutableArray new];
    for (NSInteger ii = 0; ii < 20; ii++){
        [images addObject:[UIImage imageNamed:@"social-github-32"]];
    }
    
    DATDemoImageListView* listView = [[DATDemoImageListView alloc] initWithImages:images];
    [self.stackView addArrangedSubview:listView];
    
    UILabel* bottomLabel = [UILabel new];
    bottomLabel.text = @"Bottom Label.";
    bottomLabel.backgroundColor = [UIColor greenColor];
    [self.stackView addArrangedSubview:bottomLabel];
}


- (void) viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    CGRect stackRect = CGRectZero;
    stackRect.size = [self.stackView systemLayoutSizeFittingSize:CGSizeMake(150, 0) withHorizontalFittingPriority:UILayoutPriorityRequired verticalFittingPriority:UILayoutPriorityDefaultLow];
    
    stackRect.origin.x = (self.view.bounds.size.width - stackRect.size.width) / 2.0;
    stackRect.origin.y = (self.view.bounds.size.height - stackRect.size.height) / 2.0;
    self.stackView.frame = stackRect;
}


@end
