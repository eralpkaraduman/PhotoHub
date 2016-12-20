//
//  IntroCoordinator.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/19/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

protocol IntroCoordinatorDelegate: class {
    func introCoordinatorDidFinish(_ coordinator: IntroCoordinator)
}

class IntroCoordinator: Coordinator {

    weak var delegate: IntroCoordinatorDelegate?
    var window: UIWindow!

    init(window: UIWindow) {
        self.window = window
    }

    func start() {

        let sb = UIStoryboard(name: "Intro", bundle: nil)

        guard let vc = sb.instantiateInitialViewController() as? IntroViewController else {
            fatalError()
        }

        let viewModel = HubChatPhotographyForumIntroViewModel()
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel

        window.rootViewController = vc
    }
}

extension IntroCoordinator: IntroViewModelCoordinatorDelegate {

    func introViewModel(_ viewModel: IntroViewModel, didLoadForum forum: Forum) {

    }
}
