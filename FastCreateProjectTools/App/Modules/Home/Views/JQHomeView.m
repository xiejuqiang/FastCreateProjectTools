//
//  JQHomeView.m
//  FastCreateProjectTools
//
//  Created by xiejuqiang on 2020/9/7.
//  Copyright © 2020 juqiangxie. All rights reserved.
//

#import "JQHomeView.h"

@implementation JQHomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self pointInside:point withEvent:event]){
        UITouch *touch = [[event allTouches] allObjects].firstObject;
       return self;
    }
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self printResponderChain];
    [super touchesBegan:touches withEvent:event];
}

- (void)printResponderChain
{
    UIResponder *responder = self;
    printf("%s",[NSStringFromClass([responder class]) UTF8String]);
    while (responder.nextResponder) {
        responder = responder.nextResponder;
        printf(" --> %s",[NSStringFromClass([responder class]) UTF8String]);
    }
}

@end
