# CollapsibleTableSectionViewController

[![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)]()
[![Swift 3.0](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods](https://img.shields.io/cocoapods/v/CollapsibleTableSectionViewController.svg)](https://cocoapods.org/pods/CollapsibleTableSectionViewController)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build](https://travis-ci.org/jeantimex/CollapsibleTableSectionViewController.svg?branch=master)](https://travis-ci.org/jeantimex/CollapsibleTableSectionViewController)
[![codecov.io](https://codecov.io/github/jeantimex/CollapsibleTableSectionViewController/badge.svg?branch=master)](https://codecov.io/github/jeantimex/CollapsibleTableSectionViewController?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)

Swift library to support collapsible sections in a table view.

![cover](docs/images/cover.gif)

## When can I use this pod?

This CocoaPod is still under development. 

#### Release Roadmap
- [x] Cocoa framework development folder structure
- [x] Add travis CI for unit testing
- [x] Wrap the collapsible table view in a UIViewController to hide the implementation of collapsing table sections
- [x] Basic interface design, the goal is make this library easy to use and extend for more features in the future
- [x] Add test cases, test, test and test
- [ ] Add several examples in the Examples project
- [ ] Complete the documentation
- [ ] Release

Can't wait to use it? Please checkout this repo for the implementation: https://github.com/jeantimex/ios-swift-collapsible-table-section.

## Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3.0

## Installation

### Manual

Just clone and add the following Swift files to your project:
- CollapsibleTableSectionViewController.swfit
- CollapsibleTableViewHeader.swift

### Cocoapods

- Make sure that you use latest stable Cocoapods version: `pod --version`
- If not, update it: `sudo gem install cocoapods`
- `pod init` in you project root dir
- `nano Podfile`, add:
```
use_frameworks! 
pod 'CollapsibleTableSectionViewController', :git => 'https://github.com/jeantimex/CollapsibleTableSectionViewController.git'
``` 
- Save it: `ctrl-x`, `y`, `enter`
- `pod update`
- Open generated `.xcworkspace`
- Don't forget to import CollapsibleTableSectionViewController: `import CollapsibleTableSectionViewController`!

### Carthage

* `nano Cartfile`
* put `github "jeantimex/CollapsibleTableSectionViewController" "master"` into Cartfile
* Save it: `ctrl-x`, `y`, `enter`
* Run `carthage update`
* Copy `CollapsibleTableSectionViewController.framework` from `Carthage/Build/iOS` to your project
* Make sure that `CollapsibleTableSectionViewController` is added in `Embedded Binaries` section of your target (or else you will get `dyld library not loaded referenced from ... reason image not found` error)
* Add `import CollapsibleTableSectionViewController` on top of your view controller's code

## Usage

#### Step 1. Subclass `CollapsibleTableSectionViewController`

```swift 
import CollapsibleTableSectionViewController

class ViewController: CollapsibleTableSectionViewController { ... }
```

#### Step 2. Conforms to the `CollapsibleTableSectionDelegate` protocol

```swift
extension ViewController: CollapsibleTableSectionDelegate { ... }
```

Most of the protocol methods are very similar to `UITableViewDataSource` and `UITableViewDelegate`, if you know how to use them in `UITableViewController`, then you will find our protocol methods easy to use.

Here is a list of the available protocol methods:

1. `optional func numberOfSections(_ tableView: UITableView) -> Int`<br />
Asks the data source to return the number of sections in the table view. Default is `1`.

```swift
extension ViewController: CollapsibleTableSectionDelegate {
  func numberOfSections(_ tableView: UITableView) -> Int {
    return 10
  }
}
```

2. `optional func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int`<br />
Returns the number of rows (table cells) in a specified section. Default is `0`.

```swift
extension ViewController: CollapsibleTableSectionDelegate {
  func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
}
```

3. `optional func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell`<br />
Returns the table cell at the specified index path. You can also use your custom cells, see our example projects for more details.

```swift
extension ViewController: CollapsibleTableSectionDelegate {
  func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell? ?? UITableViewCell(style: .Default, reuseIdentifier: "cell")
    cell.textLabel?.text = "Cell Text"
    return cell
  }
}
```

4. `optional func shouldCollapseByDefault(_ tableView: UITableView) -> Bool`<br />
Return `true` if you would like collapse all the sections when the table is loaded. Default is `false`.

5. `optional func shouldCollapseOthers(_ tableView: UITableView) -> Bool`<br />
Return `true` if you would like to keep only one extended section (like accordion style). Default is `false`.

6. `optional func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?`<br />
The title for each section. Default is `nil`.

7. `optional func collapsibleTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)`<br />
Tells the delegate that the specified row is now selected.

## Contribution

You are welcome to fork and submit pull requests

## License

This project is licensed under the MIT license, Copyright (c) 2017 Yong Su. For more information see `LICENSE.md`.

Author: [Yong Su](https://github.com/jeantimex) @ Box Inc.

![jeantimex](docs/images/jeantimex-logo.png)
