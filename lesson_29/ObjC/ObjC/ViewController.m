//
//  ViewController.m
//  ObjC
//
//  Created by Artem  on 07.07.2021.
//

#import "ViewController.h"
#import "MyStringDelegate.h"
#import "GenerateString.h"

@interface ViewController ()

@property (nonatomic, strong) id<MyStringDelegate> stringsDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.stringsDelegate = [[GenerateString alloc] init];
    
    NSArray *sortedArray = [self.stringsDelegate myStringArray];
    NSLog(@"%@", sortedArray);
}

@end
