//
//  CollapsibleTableSectionViewControllerTests.swift
//  CollapsibleTableSectionViewControllerTests
//
//  Created by Yong Su on 7/21/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import XCTest
@testable import CollapsibleTableSectionViewController

class CollapsibleTableSectionViewControllerTests: XCTestCase {
    
    var viewController: CollapsibleTableSectionViewController!
    
    override func setUp() {
        super.setUp()
        
        viewController = CollapsibleTableSectionViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //
    // Test viewDidLoad
    //
    
    func testViewDidLoad() {
        let _ = viewController.view
    }
    
    //
    // Test numberOfSections protocol
    //
    
    func testReturnsOnlyOneSection() {
        let tableView = UITableView()
        let numberOfSections = viewController.numberOfSections(in: tableView)
        
        XCTAssertEqual(numberOfSections, 1, "There should only be one section by default")
    }
    
    func testReturnsDefaultNumberOfSectionsWhenProtocolIsNotImplemented() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {}
        
        viewController.delegate = MockDelegate()
        
        let tableView = UITableView()
        let numberOfSections = viewController.numberOfSections(in: tableView)
        
        XCTAssertEqual(numberOfSections, 1, "There should only be 1 section by default")
    }
    
    func testReturnsNumberOfSectionsFromDelegation() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {
            func numberOfSections(_ tableView: UITableView) -> Int {
                return 5
            }
        }
        
        viewController.delegate = MockDelegate()
        
        let tableView = UITableView()
        let numberOfSections = viewController.numberOfSections(in: tableView)
        
        XCTAssertEqual(numberOfSections, 5, "There should be 5 sections")
    }
    
    //
    // Test numberOfRows protocol
    //
    
    func testReturnsZeroNumberOfRowsByDefault() {
        let tableView = UITableView()
        let numberOfRows = viewController.tableView(tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, 0, "There should be zero rows by default")
    }
    
    func testReturnsZeroNumberOfRowsWhenSectionIsCollapsed() {
        class MockCollapsibleTableSectionViewController: CollapsibleTableSectionViewController {
            override public func isSectionCollapsed(_ section: Int) -> Bool {
                return true
            }
        }
        
        viewController = MockCollapsibleTableSectionViewController()
        
        let tableView = UITableView()
        let numberOfRows = viewController.tableView(tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, 0, "There should be zero rows")
    }
    
    func testReturnsNumberOfRowsFromDelegation() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {
            func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 10
            }
        }
        
        viewController.delegate = MockDelegate()
        
        let tableView = UITableView()
        let numberOfRows = viewController.tableView(tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, 10, "There should be zero rows")
    }
    
    //
    // Test CollapsibleTableViewHeader
    //
    
    func testCollapsibleTableViewHeader() {
        let header = CollapsibleTableViewHeader.init(reuseIdentifier: "Cell")
        
        XCTAssertEqual(header.arrowLabel.textColor, UIColor.white)
        XCTAssertEqual(header.titleLabel.textColor, UIColor.white)
    }
    
}
