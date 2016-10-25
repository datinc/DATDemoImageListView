//
//  DATDemoImageListView.m
//  DATDemoImageListView
//
//  Created by DATinc on 2016-10-24.
//  Copyright © 2016 DATinc. All rights reserved.
//

#import "DATDemoImageListView.h"
#define LENGTH 32.0
@interface DATDemoImageListView ()
@property (nonatomic, strong) NSArray<UIImage*>* imageViews;
@end
@implementation DATDemoImageListView

- (instancetype) initWithImages:(NSArray<UIImage*>*) images{
    self = [super init];
    if (self){
        NSMutableArray* imageViews = [NSMutableArray new];
        for (UIImage* image in images){
            UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
            [self addSubview:imageView];
            [imageViews addObject:imageView];
        }
        self.imageViews = imageViews;
    }
    return self;
}

- (CGSize) intrinsicContentSize{
    return CGSizeMake(self.imageViews.count * LENGTH, LENGTH);
}

- (void) layoutSubviews{
    [super layoutSubviews];
    
    CGRect bounds = self.bounds;
    CGRect imageRect = CGRectMake(0, 0, LENGTH, LENGTH);
    for (UIImageView* imageView in self.imageViews){
        imageView.frame = imageRect;
        imageRect.origin.x = CGRectGetMaxX(imageRect);
        if (CGRectGetMaxX(imageRect) > CGRectGetMaxX(bounds)){
            imageRect.origin.x = 0.0;
            imageRect.origin.y = CGRectGetMaxY(imageRect);
        }
    }
}
@end
