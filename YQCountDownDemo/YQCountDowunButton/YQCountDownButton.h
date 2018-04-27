//
//  YQCountDownButton.h
//  YQCountDownDemo
//
//  Created by chase on 2018/4/27.
//  Copyright © 2018年 chase. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^YQCountDownButtonBlock)(BOOL finished);

@interface YQCountDownButton : UIButton

- (void)countDownWithDuration:(NSTimeInterval)duration completion:(YQCountDownButtonBlock)completion;

@end
