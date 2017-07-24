//
//  CollapsibleTableSectionViewController.swift
//  CollapsibleTableSectionViewController
//
//  Created by Yong Su on 7/20/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import UIKit

//
// MARK: - CollapsibleTableSectionDelegate
//
@objc public protocol CollapsibleTableSectionDelegate {
    @objc optional func numberOfSections(_ tableView: UITableView) -> Int
    @objc optional func numberOfRowsInSection(_ tableView: UITableView, section: Int) -> Int
    @objc optional func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

//
// MARK: - Section Data Structure
//
public struct Item {
    public var name: String
    public var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}

public struct Section {
    public var name: String
    public var items: [Item]
    public var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

//
// MARK: - View Controller
//
open class CollapsibleTableSectionViewController: UIViewController {
    
    open var delegate: CollapsibleTableSectionDelegate?
    
    fileprivate var tableView: UITableView!
    
    open var sections = [Section]()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the tableView
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Auto layout the tableView
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

//
// MARK: - View Controller DataSource and Delegate
//
extension CollapsibleTableSectionViewController: UITableViewDataSource, UITableViewDelegate {
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return delegate?.numberOfSections?(tableView) ?? 1
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRows = delegate?.numberOfRowsInSection?(tableView, section: section) ?? 0
        return sections[section].collapsed ? 0 : numberOfRows
    }
    
    // Cell
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return delegate?.cellForRowAt?(tableView, indexPath: indexPath) ?? UITableViewCell()
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[(indexPath as NSIndexPath).section].collapsed ? 0 : UITableViewAutomaticDimension
    }
    
    // Header
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = sections[section].name
        header.arrowLabel.text = ">"
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        header.delegate = self
        
        return header
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
}

//
// MARK: - Section Header Delegate
//
extension CollapsibleTableSectionViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
