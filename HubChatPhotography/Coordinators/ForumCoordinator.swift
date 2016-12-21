//
//  ForumCoordinator.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

class ForumCoordinator: Coordinator {

    weak var delegate: IntroCoordinatorDelegate?

    var window: UIWindow
    let forum: Forum
    let posts: [Post]

    init(window: UIWindow, forum: Forum, posts: [Post]) {
        self.window = window
        self.forum = forum
        self.posts = posts
    }

    func start() {

        let sb = UIStoryboard(name: "ForumPhotoGrid", bundle: nil)
        guard let vc = sb.instantiateInitialViewController() as? ForumPhotoGridViewController else {
            fatalError()
        }

        let viewModel = HubChatForumDetailViewModel(forum: forum, posts: posts)
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel

        vc.modalTransitionStyle = .crossDissolve
        window.rootViewController?.present(vc, animated: true, completion: nil)
    }
}

extension ForumCoordinator: ForumViewModelCoordinatorDelegate {

    internal func forumViewModel(_ viewModel: ForumViewModel, didSelectPhotoUrl url: URL) {
        
    }
}
