//
//  FirstObjCLib.m
//  FirstObjCLib
//
//  Created by Artem on 06.07.2021.
//


#import "FirstObjLibrary.h"
#import "SwiftLibrary-Swift.h"

@implementation FirstObjCLib

-(NSString*) firstObjCFunc {
    return @"ObjcFirstLib";
}

-(NSString*) secondObjCLibrary {
    ObjcSecondLib *secondObjcLib = [ObjcSecondLib new];
    return [ObjcSecondLib objcSecondFunc];
}

-(NSString*) firstSwiftLibrary {
    SwiftFirstLib *swiftFirstLibrary = [SwiftFirstLib new];
    return [swiftFirstLibrary swiftFirstFunc];
}

@end
