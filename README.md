# CollapsibleTableSectionViewController

[![Platform](https://img.shields.io/badge/platform-ios-blue.svg?style=flat)]()
[![Language](https://img.shields.io/badge/swift3-compatible-brightgreen.svg?style=flat)]()
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)]()

Swift library to support collapsible sections in a table view.

![cover](docs/images/cover.gif)

## When can I use this pod?

This CocoaPod is still under development. Can't wait to use it? Please checkout this repo for the implementation: https://github.com/jeantimex/ios-swift-collapsible-table-section.

## Requirements

- iOS 9.0+
- Xcode 8.0+
- Swift 3.0

## Installation

### Manual

Just clone and add the following Swift files to your project:
- CollapsibleTableSectionViewController.swfit
- CollapsibleTableViewCell.swift
- CollapsibleTableViewHeader.swift
- Extensions.swift

### Cocoapods

- Make sure that you use latest stable Cocoapods version: `pod --version`
- If not, update it: `sudo gem install cocoapods`
- `pod init` in you project root dir
- `nano Podfile`, add:
```
use_frameworks! 
pod 'CollapsibleTableSectionViewController', '~> 0.0.7'
``` 
- Save it: `ctrl-x`, `y`, `enter`
- `pod update`
- Open generated `.xcworkspace`
- Don't forget to import CollapsibleTableSectionViewController: `import CollapsibleTableSectionViewController`!

### Carthage

* `nano Cartfile`
* put `github "jeantimex/CollapsibleTableSectionViewController" ~> 0.0.7` into Cartfile
* Save it: `ctrl-x`, `y`, `enter`
* Run `carthage update`
* Copy `CollapsibleTableSectionViewController.framework` from `Carthage/Build/iOS` to your project
* Make sure that `CollapsibleTableSectionViewController` is added in `Embedded Binaries` section of your target (or else you will get `dyld library not loaded referenced from ... reason image not found` error)
* Add `import CollapsibleTableSectionViewController` on top of your view controller's code

## Usage

This project is still under development, once it's completed, this section will be updated.

## Contribution

You are welcome to fork and submit pull requests

## License

This project is licensed under the MIT license, Copyright (c) 2017 Yong Su. For more information see `LICENSE.md`.

Author: [Yong Su](https://github.com/jeantimex) @ Box Inc.
