# CollapsibleTableSectionViewController

[![Financial Contributors on Open Collective](https://opencollective.com/CollapsibleTableSectionViewController/all/badge.svg?label=financial+contributors)](https://opencollective.com/CollapsibleTableSectionViewController) [![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)]()
[![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![CocoaPods](https://img.shields.io/cocoapods/v/CollapsibleTableSectionViewController.svg)](https://cocoapods.org/pods/CollapsibleTableSectionViewController)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Build](https://travis-ci.org/jeantimex/CollapsibleTableSectionViewController.svg?branch=master)](https://travis-ci.org/jeantimex/CollapsibleTableSectionViewController)
[![codecov.io](https://codecov.io/github/jeantimex/CollapsibleTableSectionViewController/badge.svg?branch=master)](https://codecov.io/github/jeantimex/CollapsibleTableSectionViewController?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BFXQGY77CV3T2)

A Swift library that helps you collapse table view sections.

![cover](https://user-images.githubusercontent.com/565300/33296447-99433820-d390-11e7-8d05-bcac316e896a.gif)

## Features

- Support collapsible sections in a table view
- Collapse all the sections by default (configurable)
- Keep only one section expanded (configurable)
- Auto resize table view cell
- Easy-to-use protocols for configuration

## Requirements

- iOS 9.0+
- Xcode 10.0+
- Swift 4.2

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
pod 'CollapsibleTableSectionViewController', '~> 2.0.1'
``` 
- Save it: `ctrl-x`, `y`, `enter`
- `pod update`
- Open generated `.xcworkspace`
- Don't forget to import CollapsibleTableSectionViewController: `import CollapsibleTableSectionViewController`!

### Carthage

* `nano Cartfile`
* put `github "jeantimex/CollapsibleTableSectionViewController" ~> 2.0.1` into Cartfile
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

## CollapsibleTableSectionDelegate Protocol

Most of the protocol methods are optional and they are very similar to `UITableViewDataSource` and `UITableViewDelegate`, here is a list of the available protocol methods:

#### 1. optional func numberOfSections(_ tableView: UITableView) -> Int
Asks the data source to return the number of sections in the table view. Default is `1`.

```swift
extension ViewController: CollapsibleTableSectionDelegate {
  func numberOfSections(_ tableView: UITableView) -> Int {
    return 10
  }
}
```

#### 2. optional func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
Returns the number of rows (table cells) in a specified section. Default is `0`.

```swift
extension ViewController: CollapsibleTableSectionDelegate {
  func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
}
```

#### 3. optional func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

Returns the table cell at the specified index path. You can also use your custom cells, see our example projects for more details.

```swift
extension ViewController: CollapsibleTableSectionDelegate {
  func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as UITableViewCell? ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
    cell.textLabel?.text = "Cell Text"
    return cell
  }
}
```

#### 4. optional func shouldCollapseByDefault(_ tableView: UITableView) -> Bool

Return `true` if you would like collapse all the sections when the table is loaded. Default is `false`.

#### 5. optional func shouldCollapseOthers(_ tableView: UITableView) -> Bool

Return `true` if you would like to keep only one extended section (like accordion style). Default is `false`.

#### 6. optional func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?

The title for each section. Default is `nil`.

#### 7. optional func collapsibleTableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)

Tells the delegate that the specified row is now selected.

## Examples

Run the Examples project in this repo and you will find the following demos that help you get up and running:

1. Basic: The minimal working example
2. Custom Cell: Implement a custom cell programmatically
3. Collapse By Default: All sections are collapsed by default
4. Collapse Others: Accordion-style table view that only keeps one section expanded at a time

For more details of how to implement collapsible table sections using Swift, please checkout this repo for more information: https://github.com/jeantimex/ios-swift-collapsible-table-section.

## Contribution

Anyone who would like to contribute to the project is more than welcome.

* Fork this repo
* Make your changes
* Submit pull request

## Contributors

### Code Contributors

This project exists thanks to all the people who contribute. [[Contribute](CONTRIBUTING.md)].
<a href="https://github.com/jeantimex/CollapsibleTableSectionViewController/graphs/contributors"><img src="https://opencollective.com/CollapsibleTableSectionViewController/contributors.svg?width=890&button=false" /></a>

### Financial Contributors

Become a financial contributor and help us sustain our community. [[Contribute](https://opencollective.com/CollapsibleTableSectionViewController/contribute)]

#### Individuals

<a href="https://opencollective.com/CollapsibleTableSectionViewController"><img src="https://opencollective.com/CollapsibleTableSectionViewController/individuals.svg?width=890"></a>

#### Organizations

Support this project with your organization. Your logo will show up here with a link to your website. [[Contribute](https://opencollective.com/CollapsibleTableSectionViewController/contribute)]

<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/0/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/0/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/1/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/1/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/2/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/2/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/3/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/3/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/4/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/4/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/5/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/5/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/6/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/6/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/7/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/7/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/8/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/8/avatar.svg"></a>
<a href="https://opencollective.com/CollapsibleTableSectionViewController/organization/9/website"><img src="https://opencollective.com/CollapsibleTableSectionViewController/organization/9/avatar.svg"></a>

## License

MIT License

Copyright (c) 2017 Yong Su @jeantimex

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
