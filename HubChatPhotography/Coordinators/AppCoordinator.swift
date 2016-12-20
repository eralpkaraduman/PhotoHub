//
//  AppCoordinator.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/19/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {

    enum CoordinatorKey: String {
        case intro
    }

    let window: UIWindow
    var coordinators = [CoordinatorKey : Coordinator]()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {

        showIntro()
    }
}

extension AppCoordinator: IntroCoordinatorDelegate {

    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    func showIntro() {
        let coordinator = IntroCoordinator(window: window)
        coordinators[.intro] = coordinator
        coordinator.delegate = self
        coordinator.start()
    }

    func introCoordinatorDidFinish(_ coordinator: IntroCoordinator) {

    }
}
