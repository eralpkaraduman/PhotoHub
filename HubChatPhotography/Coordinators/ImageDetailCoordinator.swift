//
//  ImageDetailCoordinator.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

protocol ImageDetailCoordinatorDelegate: class {
    func imageDetailCoordinatorDidFinish(_ coordinator: ImageDetailCoordinator)
}

class ImageDetailCoordinator: Coordinator {

    weak var delegate: ImageDetailCoordinatorDelegate? = nil

    var window: UIWindow
    let imageUrl: URL

    init(window: UIWindow, imageUrl: URL) {
        self.window = window
        self.imageUrl = imageUrl
    }

    func start() {
        let controller = ImageDetailViewController()
        controller.imageUrl = imageUrl
        controller.modalTransitionStyle = .coverVertical
        controller.delegate = self

        let presentedController = window.rootViewController?.presentedViewController
        presentedController?.present(controller, animated: true, completion: nil)
    }
}

extension ImageDetailCoordinator: ImageDetailViewControllerDelegate {

    func imageDetailViewControllerDidFinish(_ controller: ImageDetailViewController) {

        controller.presentingViewController?.dismiss(animated: true, completion: {
            self.delegate?.imageDetailCoordinatorDidFinish(self)
        })
    }
}
