//
// MLFullscreenModalHeader.m
// MLUI
//
// Created by Cristian Gimenez on 14/03/2019.
// Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "MLFullscreenModalHeader.h"
#import <MLUI/UILabel+MLStyle.h>
#import "MLUIBundle.h"

static const CGFloat kMLFullscreenModalHeaderViewAnimationDuration = 0.3f;

@interface MLFullscreenModalHeader ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

@end

@implementation MLFullscreenModalHeader

+ (instancetype)simpleHeaderView
{
	return [[MLUIBundle mluiBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;
}

- (void)awakeFromNib
{
	[super awakeFromNib];
	[self.titleLabel ml_setStyle:MLStyleLightXLarge];
}

- (void)setTitle:(NSString *)title
{
	__weak typeof(self) weakSelf = self;

	[UIView transitionWithView:self.titleLabel duration:kMLFullscreenModalHeaderViewAnimationDuration options:UIViewAnimationOptionTransitionCrossDissolve animations: ^{
	    weakSelf.titleLabel.text = title;
	} completion:nil];
}

- (NSString *)title
{
	return self.titleLabel.text;
}

@end
