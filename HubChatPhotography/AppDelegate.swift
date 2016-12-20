//
//  AppDelegate.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/19/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        guard let window = window else { return false }

        appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()

        window.makeKeyAndVisible()

        return true
    }
}
