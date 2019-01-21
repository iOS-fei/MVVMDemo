//
//  MVVMDemoTests.m
//  MVVMDemoTests
//
//  Created by 张飞 on 2019/1/21.
//  Copyright © 2019 张飞. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MainViewModel.h"
#import "YTOMyOrderCellViewModel.h"
#import "MainModel.h"
#import "ReactiveObjC.h"
@interface MVVMDemoTests : XCTestCase

@end

@implementation MVVMDemoTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    
    MainViewModel *mainVM = [[MainViewModel alloc] init];
    NSMutableArray *listArr = [mainVM valueForKey:@"listArr"];

    [mainVM requestSuccessBlock:^(id  _Nonnull data) {

    } failureBlock:^(NSString * _Nonnull errorMsg) {
        XCTAssertEqualObjects(errorMsg, @"123");
    }];
    [mainVM didSelectRowWithIndex:2];
    YTOMyOrderCellViewModel *cellVM = listArr[2];
    XCTAssertEqualObjects(cellVM.mainModel.address, @"我是会改变的!");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
