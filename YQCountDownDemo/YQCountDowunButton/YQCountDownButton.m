//
//  YQCountDownButton.m
//  YQCountDownDemo
//
//  Created by chase on 2018/4/27.
//  Copyright © 2018年 chase. All rights reserved.
//

#import "YQCountDownButton.h"

@interface YQCountDownButton()
@property (nonatomic, copy) YQCountDownButtonBlock completion;
@property (nonatomic, weak) NSTimer *timer;
@property (nonatomic, assign) NSTimeInterval duration;
@end

NSString *const kYQCountDownButtonUnitTime = @"s";
@implementation YQCountDownButton

#pragma mark - Public
- (void)countDownWithDuration:(NSTimeInterval)duration completion:(YQCountDownButtonBlock)completion {
    self.enabled = NO;
    _duration = duration;
    _completion = completion;
    [self setTitle:[NSString stringWithFormat:@"%ld%@"
                    , (long)duration
                    , kYQCountDownButtonUnitTime] forState:UIControlStateDisabled];
    [self setBackgroundImage:[self createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
    [self setupTimer];
}

#pragma mark - Private
- (void)setupTimer {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    _timer = timer;
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)countDown {
    _duration --;
    if (_duration == 0) {
        [self invalidTimer];
        self.enabled = YES;
        if (_completion) {
            _completion(YES);
        }
    }else {
        [self setTitle:[NSString stringWithFormat:@"%ld%@"
                        , (long)_duration
                        , kYQCountDownButtonUnitTime] forState:UIControlStateDisabled];
    }
}

// 无效定时器
- (void)invalidTimer {
    [_timer invalidate];
    _timer = nil;
}

// 颜色转图片
- (UIImage*)createImageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

// 当父视图释放时，释放定时器
- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (!newSuperview) {
        [self invalidTimer];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
