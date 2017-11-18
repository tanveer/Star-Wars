//
//  AppDelegate.swift
//  Star Warspedia
//
//  Created by Tanveer Bashir on 6/17/17.
//  Copyright © 2017 Tanveer Bashir. All rights reserved.
//

import UIKit
import SVProgressHUD
let startPageNumber = 1

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        appearance()
        return true
    }

    private func appearance() {
        window?.tintColor = .SWOrange
        let navAppearance =  UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self])

        navAppearance.barTintColor = .SWOffBlack
        navAppearance.tintColor = .SWOrange
        UITabBar.appearance().barTintColor = .SWOffBlack
        navAppearance.titleTextAttributes = [
            NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor.SWOrange,
            NSAttributedStringKey(rawValue: NSAttributedStringKey.font.rawValue): UIFont.bold(18)]

        SVProgressHUD.setDefaultAnimationType(.native)
        SVProgressHUD.setForegroundColor(.SWOrange)

    }
}
