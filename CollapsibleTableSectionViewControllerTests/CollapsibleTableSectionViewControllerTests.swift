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
    var tableView: UITableView!
    
    override func setUp() {
        super.setUp()
        
        viewController = CollapsibleTableSectionViewController()
        tableView = UITableView()
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
        
        let numberOfSections = viewController.numberOfSections(in: tableView)
        
        XCTAssertEqual(numberOfSections, 5, "There should be 5 sections")
    }
    
    //
    // Test numberOfRows protocol
    //
    
    func testReturnsZeroNumberOfRowsByDefault() {
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
        
        let numberOfRows = viewController.tableView(tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRows, 10, "There should be zero rows")
    }
    
    //
    // Test cellForRowAt protocol
    //
    
    func testReturnsDefaultCell() {
        let cell: UITableViewCell = viewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell.reuseIdentifier, "DefaultCell")
    }
    
    func testReturnsCellFromDelegation() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {
            func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                return UITableViewCell.init(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "CustomCell")
            }
        }
        
        viewController.delegate = MockDelegate()
        
        let cell: UITableViewCell = viewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell.reuseIdentifier, "CustomCell")
    }
    
    func testReturnsDefaultCellWhenProtocolIsNotImplemented() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {}
        
        viewController.delegate = MockDelegate()
        
        let cell: UITableViewCell = viewController.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(cell.reuseIdentifier, "DefaultCell")
    }
    
    //
    // Test heightForRowAt
    //
    
    func testReturnsUITableViewAutomaticDimension() {
        let heightForRowAt = viewController.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(heightForRowAt, UITableView.automaticDimension)
    }
    
    //
    // Test heightForHeaderInSection
    //
    
    func testReturnsDefaultHeightForHeaderInSection() {
        let heightForHeaderInSection = viewController.tableView(tableView, heightForHeaderInSection: 0)
        
        XCTAssertEqual(heightForHeaderInSection, 44.0)
    }
    
    func testReturnsHeightForHeaderInSectionFromDelegation() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {
            func collapsibleTableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                return 100.0
            }
        }
        
        viewController.delegate = MockDelegate()
        
        let heightForHeaderInSection = viewController.tableView(tableView, heightForHeaderInSection: 0)
        
        XCTAssertEqual(heightForHeaderInSection, 100.0)
    }
    
    func testReturnsDefaultHeightForHeaderInSectionWhenProtocolIsNotImplemented() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {}
        
        viewController.delegate = MockDelegate()
        
        let heightForHeaderInSection = viewController.tableView(tableView, heightForHeaderInSection: 0)
        
        XCTAssertEqual(heightForHeaderInSection, 44.0)
    }
    
    //
    // Test heightForFooterInSection
    //
    
    func testReturnsDefaultHeightForFooterInSection() {
        let heightForFooterInSection = viewController.tableView(tableView, heightForFooterInSection: 0)
        
        XCTAssertEqual(heightForFooterInSection, 0.0)
    }
    
    func testReturnsHeightForFooterInSectionFromDelegation() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {
            func collapsibleTableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
                return 100.0
            }
        }
        
        viewController.delegate = MockDelegate()
        
        let heightForFooterInSection = viewController.tableView(tableView, heightForFooterInSection: 0)
        
        XCTAssertEqual(heightForFooterInSection, 100.0)
    }
    
    func testReturnsDefaultHeightForFooterInSectionWhenProtocolIsNotImplemented() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {}
        
        viewController.delegate = MockDelegate()
        
        let heightForFooterInSection = viewController.tableView(tableView, heightForFooterInSection: 0)
        
        XCTAssertEqual(heightForFooterInSection, 0.0)
    }
    
    //
    // Test didSelectRowAt
    //
    
    func testDidSelectRowAtDidCalledInDelegation() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {
            public var didSelectRowAtWasCalled = false
            
            func collapsibleTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                didSelectRowAtWasCalled = true
            }
        }
        
        let delegateMock = MockDelegate()
        
        viewController.delegate = delegateMock
        viewController.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssert(delegateMock.didSelectRowAtWasCalled)
    }
    
    //
    // Test toggleSection
    //
    
    func testReturnsCurrentSectionThatNeedsReload() {
        let sectionsNeedReload = viewController.getSectionsNeedReload(0)
        
        XCTAssertEqual(sectionsNeedReload, [0])
    }
    
    func testReturnsSectionsThatNeedsReload() {
        // Mock the CollapsibleTableSectionDelegate
        class MockDelegate: CollapsibleTableSectionDelegate {
            func shouldCollapseOthers(_ tableView: UITableView) -> Bool {
                return true
            }
        }
        
        class MockCollapsibleTableSectionViewController: CollapsibleTableSectionViewController {
            override public func isSectionCollapsed(_ section: Int) -> Bool {
                return true
            }
        }
        
        viewController = MockCollapsibleTableSectionViewController()
        viewController.delegate = MockDelegate()
        
        let _ = viewController.view
        let sectionsNeedReload = viewController.getSectionsNeedReload(0)
        
        XCTAssertEqual(sectionsNeedReload, [0])
    }
    
    //
    // Test header
    //
    
    func testReturnsDefaultHeader() {
        let header: CollapsibleTableViewHeader = viewController.tableView(tableView, viewForHeaderInSection: 0) as! CollapsibleTableViewHeader
        
        XCTAssertEqual(header.titleLabel.text, "")
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
