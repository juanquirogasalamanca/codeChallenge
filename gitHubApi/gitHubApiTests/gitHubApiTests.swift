//
//  gitHubApiTests.swift
//  gitHubApiTests
//
//  Created by Juan Guillermo Quiroga Salamanca on 11/5/19.
//  Copyright © 2019 Juan Guillermo Quiroga Salamanca. All rights reserved.
//

import XCTest
@testable import gitHubApi

class gitHubApiTests: XCTestCase {
    var searchVc: SearchScreenViewController!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        searchVc = SearchScreenViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // given
        let input = "Juanelo"
        let output = searchVc.getResutls(searchStr: input)
        // Then
//            XCTAssertTrue(spy.didSomething, "someMethod() should do  this")
//            XCTAssertEqual(output, "SomeOtherString", "someMethod() should return the correct string")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
