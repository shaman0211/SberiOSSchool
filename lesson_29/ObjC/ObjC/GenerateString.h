//
//  GenerateString.h
//  ObjC
//
//  Created by Artem  on 07.07.2021.
//

#import <Foundation/Foundation.h>
#import "MyStringDelegate.h"


NS_ASSUME_NONNULL_BEGIN

@interface GenerateString : NSObject <MyStringDelegate>

- (NSArray *)getStringsArray;

@end

NS_ASSUME_NONNULL_END
