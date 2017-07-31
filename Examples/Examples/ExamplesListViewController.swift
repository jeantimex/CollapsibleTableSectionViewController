//
//  ExamplesListViewController.swift
//  Examples
//
//  Created by Yong Su on 7/30/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import UIKit

typealias ExampleTuple = (title: String, description: String, viewController: UIViewController)

class ExamplesListViewController: UITableViewController {
    
    let examples: [ExampleTuple] = [
        ("Basic", "The minimal working example", BasicExampleViewController()),
        ("Custom Cell", "Implement a custom cell programmatically", CustomCellExampleViewController()),
        ("Collapse By Default", "All sections are collapsed by default", CollapseByDefaultExampleViewController()),
        ("Collapse Others", "Accordion-style table view that only keeps one section expanded at a time", CollapseOthersExampleViewController())
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Examples"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExampleCell") as UITableViewCell? ?? UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "ExampleCell")
        let example = examples[indexPath.row]

        cell.textLabel?.text = example.title
        cell.detailTextLabel?.text = example.description
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = examples[indexPath.row].viewController
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
