//
//  GenerateString.m
//  ObjC
//
//  Created by Artem  on 07.07.2021.
//

#import <Foundation/Foundation.h>
#import "GenerateString.h"


@implementation GenerateString 

- (NSArray *)myStringArray
{
    
    NSArray *array = @[
        @"Hi",
        @"Artem",
        @"Aslanbek",
        @"Pizza",
        @"Pasta",
        @"Hinkal"
    ];
    
    
    NSArray *sortedArray = [array sortedArrayUsingComparator: ^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        
        unsigned long firstObjc = [[obj1 componentsSeparatedByString:@"A"] count];
        unsigned long secondObjc = [[obj2 componentsSeparatedByString:@"A"] count];

        
        if (firstObjc > secondObjc) {
            return NSOrderedAscending;
        }
        else if (secondObjc > firstObjc) {
            return NSOrderedDescending;
        }
        return NSOrderedSame;
    
    }];

    return sortedArray;
}

@end
