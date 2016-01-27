//
//  NSString_STRegexTests.m
//  NSString+STRegexTests
//
//  Created by stlwtr on 15/6/15.
//  Copyright (c) 2015年 yls. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "NSString+STRegex.h"

@interface NSString_STRegexTests : XCTestCase

@end

@implementation NSString_STRegexTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPostalcode {
    NSString *postalcode = @"055350";
    BOOL rc = [postalcode isValidPostalcode];
    XCTAssertTrue(rc);
}

- (void)testChinese {
    NSString *postalcode = @"我的";
    BOOL rc = [postalcode isValidChinese];
    XCTAssertTrue(rc);
    
    postalcode = @"我";
    rc = [postalcode isValidChinese];
    XCTAssertTrue(rc);
}

@end
