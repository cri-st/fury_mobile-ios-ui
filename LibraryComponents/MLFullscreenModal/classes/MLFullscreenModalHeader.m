//
// MLFullscreenModalHeader.m
// MLUI
//
// Created by Cristian Gimenez on 14/03/2019.
// Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "MLFullscreenModalHeader.h"
#import "UIFont+MLFonts.h"
#import "MLUIBundle.h"

static const CGFloat kMLFullscreenModalHeaderViewAnimationDuration = 0.3f;

@interface MLFullscreenModalHeader ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopConstraint;

@end

@implementation MLFullscreenModalHeader

+ (instancetype)simpleHeaderView
{
	return [[MLUIBundle mluiBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;
}

- (void)awakeFromNib
{
	[super awakeFromNib];
	self.titleLabel.font = [UIFont ml_semiboldSystemFontOfSize:kMLFontsSizeXLarge];
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

- (void)setScrollEnabled:(BOOL)scrollEnabled
{
	_scrollEnabled = scrollEnabled;
	if (scrollEnabled) {
		self.titleLabelTopConstraint.constant = 15;
	} else {
		self.titleLabelTopConstraint.constant = 66;
	}
}

@end
