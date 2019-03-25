//
// MLFullscreenModal.m
// MLUI
//
// Created by Cristian Gimenez on 13/03/2019.
// Copyright © 2019 MercadoLibre. All rights reserved.
//

#import "MLFullscreenModal.h"
#import "MLFullscreenModalHeader.h"
#import "MLStyleSheetManager.h"
#import <MLUI/MLUIHeader.h>
#import <MLUI/UIColor+MLColorPalette.h>

@interface MLFullscreenModal () <MLUIHeaderDelegate>

@property (nonatomic) MLUIHeader *headerViewController;
@property (nonatomic) UIView *containerView;

@property (nonatomic, strong) MLFullscreenModalHeader *simpleHeaderView;

@end

@implementation MLFullscreenModal

- (instancetype)initWithViewController:(UIViewController *)innerViewController title:(NSString *)title enableScroll:(BOOL)enable
{
	self = [super init];
	if (self) {
		self.title = title;
		self.containerView = innerViewController.view;
	}
	return self;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.simpleHeaderView = [MLFullscreenModalHeader simpleHeaderView];
	self.simpleHeaderView.title = self.title;

	_headerViewController = [[MLUIHeader alloc] init];
	_headerViewController.delegate = self;
	_headerViewController.hasShadow = YES;
	[_headerViewController setNavigationBarBackgroundcolor:[UIColor ml_meli_white]];
	[_headerViewController didMoveToParentViewController:self];

	[self addChildViewController:_headerViewController];
	[self.view addSubview:_headerViewController.view];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];

	[_headerViewController setNavigationBarBackgroundcolor:[UIColor ml_meli_yellow]];
}

- (void)setTitle:(NSString *)title
{
	[super setTitle:title];
	if (title.length > 0) {
		self.simpleHeaderView.title = title;
	}
}

- (UIView *)headerView
{
	return self.simpleHeaderView;
}

- (UIView *)contentView
{
	return self.containerView;
}

- (BOOL)shouldScrollContent
{
	return YES;
}

@end
