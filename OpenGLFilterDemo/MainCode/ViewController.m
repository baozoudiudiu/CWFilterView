//
//  ViewController.m
//  001--滤镜处理
//
//  Created by CC老师 on 2019/4/23.
//  Copyright © 2019年 CC老师. All rights reserved.
//

#import "ViewController.h"
#import "CWFilterView.h"
#import <Masonry/Masonry.h>
#import "FilterBar.h"


@interface ViewController ()<FilterBarDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, weak) IBOutlet UIView *bottomView;
@property (nonatomic, strong) CWFilterView  *filterView;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.filterView = [[CWFilterView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.filterView];
    [self.filterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.bottomView.mas_top);
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
    }];
    
    FilterBar *filerBar = [[FilterBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    filerBar.delegate = self;
    [self.bottomView addSubview:filerBar];
    NSArray *dataSource = @[
        @"原图",
        @"上下分屏",
        @"三分屏",
        @"4分屏",
        @"6分屏幕",
        @"9分屏",
        @"灰度",
        @"颠倒",
        @"马赛克",
        @"六边形马赛克",
        @"三角形马赛克",
        @"缩放效果",
        @"灵魂出窍",
        @"抖动效果",
        @"闪白效果",
        @"毛刺效果",
        @"幻觉效果"
    ];
    filerBar.itemList = dataSource;
    [filerBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.bottomView);
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    UIImage *image = [UIImage imageNamed:@"demo.jpg"];
    [self.filterView showImage:image];
}

- (void)filterBar:(FilterBar *)filterBar didScrollToIndex:(NSUInteger)index {
    switch (index) {
        case 0:
            [self.filterView splitScreenTopAndBottom:NO];
            break;
        case 1:
            [self.filterView splitScreenTopAndBottom:YES];
            break;
        case 2:
            [self.filterView splitScreenTMB:YES];
            break;
        case 3:
        [self.filterView splitScreen4:YES];
            break;
        case 4:
            [self.filterView splitScreen6:YES];
            break;
        case 5:
            [self.filterView splitScreen9:YES];
            break;
        case 6:
            [self.filterView gray:YES];
            break;
        case 7:
            [self.filterView reversal:YES];
            break;
        case 8:
            [self.filterView mosaic:YES];
            break;
        case  9:
            [self.filterView hexagonMosaic:YES];
            break;
        case 10:
            [self.filterView triangularMosaic:YES];
            break;
        case 11:
            [self.filterView scale:YES];
            break;
        case 12:
            [self.filterView soulOut:YES];
            break;
        case 13:
            [self.filterView shake:YES];
            break;
        case 14:
            [self.filterView white:YES];
            break;
        case 15:
            [self.filterView glitch:YES];
            break;
        case 16:
            [self.filterView vertigo:YES];
            break;
        default:
            break;
    }
}

#pragma mark - <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
- (IBAction)chooseImage {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [self.filterView showImage:image];
}
@end
