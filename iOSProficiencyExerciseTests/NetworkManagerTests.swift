//
//  NetworkManagerTests.swift
//  iOSProficiencyExerciseTests
//
//  Created by Liu Changhong on 6/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import XCTest
@testable import iOSProficiencyExercise

class NetworkManagerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
      NetworkManager.shared.performMainScreenGetRequest { (result) in
        switch result {
        case .success(let viewModel):
          XCTAssertEqual(viewModel.title, "About Canada")
          XCTAssertEqual(viewModel.rows.count, 14)
        case .failure(let error):
          XCTFail("Something went wrong while request data - \(error.rawValue)")
        }
      }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
