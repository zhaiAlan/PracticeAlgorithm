//
//  ViewController.m
//  PracticeAlgorithm
//
//  Created by Alan on 2019/3/4.
//  Copyright © 2019 zhaixingzhi. All rights reserved.
//

#import "ViewController.h"
#include "string.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    /**
     给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
     不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
     */
    // nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
    NSMutableArray *nums = [@[@0,@0,@1,@1,@1,@2,@2,@3,@3,@4] mutableCopy];
    int len = [self removeDuplicates:nums];
    
    // 在函数里修改输入数组对于调用者是可见的。
    // 根据你的函数返回的长度, 它会打印出数组中该长度范围内的所有元素。
    for (int i = 0; i < len; i++) {
        NSLog(@"%@",nums[i]);
    }
    
//    NSString *s = [self longestPalindromeSimple:@"abaf"];
//    NSLog(@"%@",s);

}

#pragma mark ---

-(int)removeDuplicates:(NSMutableArray *)nums {
    if (nums.count == 0) return 0;
    int i = 0;
    for (int j = 1; j < nums.count; j++) {
        if (nums[j] != nums[i]) {
            i++;
            nums[i] = nums[j];
        }
    }
    return i + 1;
}

#pragma mark -题目大意:给定一个字符串S,找出S串中最长的回文子串.你可以假设s的最大长度为1000.
-(NSString *)longestPalindromeSimple:(NSString *)s
{
    int n = s.length;
    if (n == 0) return @"";
    //单个字符也是回文字符
    NSString *longest = [s substringWithRange:NSMakeRange(0, 1)];
    for (int i = 0; i < n-1; i++) {
        NSString *p1 = [self expandAroundCenter:s:i:i];
        if (p1.length> longest.length)
            longest = p1;
        
        NSString *p2 = [self expandAroundCenter:s :i:i+1];
        if (p2.length > longest.length)
            longest = p2;
    }
    return longest;
}
- (NSString *)expandAroundCenter:(NSString *)s :(int)c1 :(int)c2{
    int l = c1, r = c2;
    int n = s.length;
    while (l >= 0 && r <= n-1 && [s characterAtIndex:l] == [s characterAtIndex:r]) {
        l--;
        r++;
    }
    return [s substringWithRange:NSMakeRange(l+1, r-l-1)];
}
@end
