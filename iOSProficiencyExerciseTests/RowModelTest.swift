//
//  RowModelTest.swift
//  iOSProficiencyExerciseTests
//
//  Created by Liu Changhong on 6/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import XCTest
@testable import iOSProficiencyExercise

class RowModelTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRowModel() {
        let jsonString = """
                    {
                    "title":"Space Program",
                    "description":"Canada hopes to soon launch a man to the moon.",
                    "imageHref": null
                    }
                    """
        
        let json = jsonString.data(using: .utf8)!
        let row1 = try? JSONDecoder().decode(Row.self, from: json)
        let row2 = Row(title: "Space Program", description: "Canada hopes to soon launch a man to the moon.", imageHref: nil)
        XCTAssertEqual(row1?.title, row2.title)
        XCTAssertEqual(row1?.description, row2.description)
        XCTAssertEqual(row1?.imageHref, row2.imageHref)
    }
    
    func testMainScrViewModel() {
        let jsonString = """
                        {
                        "title":"About Canada",
                        "rows":[
                            {
                            "title":"Beavers",
                            "description":"Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony",
                            "imageHref":"http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
                            },
                            {
                            "title":"Flag",
                            "description":null,
                            "imageHref":"http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png"
                            }]
                        }
                        """
        let json = jsonString.data(using: .utf8)!
        let viewModel1 = try? JSONDecoder().decode(MainScreenViewModel.self, from: json)
        let viewModel2 = MainScreenViewModel(title: "About Canada", rows: [Row(title: "Beavers", description: "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony", imageHref: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"), Row(title: "Flag", description: nil, imageHref: "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png")])
        
        XCTAssertEqual(viewModel1?.title, viewModel2.title)
        XCTAssertEqual(viewModel1?.rows.first?.title, viewModel2.rows.first?.title)
        XCTAssertEqual(viewModel1?.rows.first?.imageHref, viewModel2.rows.first?.imageHref)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
