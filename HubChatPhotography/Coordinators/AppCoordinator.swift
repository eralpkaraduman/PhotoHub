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
        case forum
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

    func showIntro() {
        let coordinator = IntroCoordinator(window: window)
        coordinators[.intro] = coordinator
        coordinator.delegate = self
        coordinator.start()
    }

    func introCoordinatorDidFinish(_ coordinator: IntroCoordinator, forum: Forum, posts: [Post]) {

        coordinators[.forum] = nil
        showForum(forum, posts: posts)
    }
}

extension AppCoordinator {

    func showForum(_ forum: Forum, posts: [Post]) {

        let coordinator = ForumCoordinator(
            window: window,
            forum: forum,
            posts: posts
        )

        coordinators[.forum] = coordinator
        coordinator.start()
    }
}
