//
//  ViewController.m
//  KVC
//
//  Created by Risen on 2017/10/9.
//  Copyright © 2017年 Risen. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "book.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Dog *dog =[[Dog alloc]init];
    
    
//    dog->height = 12.0; //
//    NSLog(@"dog is height is = %@",dog->height);
    
    [dog setValue:@15 forKey:@"height"]; //给私有变量赋值
    NSLog(@"dog's height is = %@",[dog valueForKey:@"height"]);//读取私有变量的值
    // Do any additional setup after loading the view, typically from a nib.
   // 实际使用举例
   // 利用kvc的这个特性，我们可以访问系统里的一些私有变量。
   // 例如：在UIPageControl里面有两个私有变量：
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    //设置值
    [pageControl setValue:[UIImage imageNamed:@"555"] forKeyPath:@"_currentPageImage"];
    [pageControl setValue:[UIImage imageNamed:@"newindex_01"] forKeyPath:@"_pageImage"];
    //读取值
    UIImage *currentImage = [pageControl valueForKey:@"_currentPageImage"];
    UIImage *pageImage =[pageControl valueForKey:@"_pageImage"];
    //这样我们就可以设置当前显示和未显示到脚标的样式了。
    
    
    //2. 使用KVC直接访问 NSArray 或者 NSSet 的属性值
    // NSArray/NSSet等都支持KVC,这里举一个列子
    book * book1 =[[book alloc]init];
    book1.price = 1;
    book1.name = @"we";
    book * book2 =[[book alloc]init];
    book2.price = 2;
    book2.name = @"edg";
    book * book3 =[[book alloc]init];
    book3.price = 3;
    book3.name = @"rng";
    
    NSArray *books = @[book1,book2,book3];
    NSArray *names =[books valueForKeyPath:@"name"];
    NSLog(@"names=%@",names);
    NSLog(@"books=%@",[books valueForKeyPath:@"@avg.price"]);//使用kvc直接打印出来书的平均价格
    
    
   // 3. 使用KVC将字典（json）转化成模型
    
    // 定义一个字典
    NSDictionary *dict =@{
                          @"name":@"jack",
                          @"money":@"20.7"
                          };
    //创建模型
    Person *p =[[Person alloc] init];
    //字典转模型
    [p setValuesForKeysWithDictionary:dict];
    NSLog(@"person's name is the %@",p.name);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
