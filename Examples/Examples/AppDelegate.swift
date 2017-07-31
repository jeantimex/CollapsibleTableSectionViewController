//
//  AppDelegate.swift
//  Examples
//
//  Created by Yong Su on 7/21/17.
//  Copyright © 2017 jeantimex. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame:UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = UINavigationController(rootViewController: ExamplesListViewController())
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

