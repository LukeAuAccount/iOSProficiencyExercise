//
//  ViewControllerTests.swift
//  iOSProficiencyExerciseTests
//
//  Created by Liu Changhong on 6/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import XCTest
@testable import iOSProficiencyExercise

class ViewControllerTests: XCTestCase {
  
  let mainVC = MainViewController()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
      mainVC.configureViewController()
      mainVC.configureTableView()
      XCTAssert(mainVC.view.subviews.count != 0, "MainViewController's view has no subViews")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
