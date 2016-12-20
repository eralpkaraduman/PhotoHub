//
//  IntroViewModel.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

class HubChatPhotographyForumIntroViewModel: IntroViewModel {

    weak var coordinatorDelegate: IntroViewModelCoordinatorDelegate?
    weak var viewDelegate: IntroViewModelViewDelegate?

    var fetchForumTask: URLSessionTask? = nil
    var fetchPostsTask: URLSessionTask? = nil

    var titleText: String {
        return "Loading HubChat Photography Forum"
    }

    func loadForum() {

        fetchPostsTask?.cancel()
        fetchForumTask?.cancel()

        fetchForumTask = HubChatApiClient.shared.fetchForum(.photography) { (error, forum) in

            guard let forum = forum, error == nil else {
                self.reportError(error)
                return
            }

            self.loadPostsForForum(forum)
        }

    }

    func loadPostsForForum(_ forum: Forum) {

        fetchPostsTask?.cancel()

        fetchPostsTask = HubChatApiClient.shared.fetchPostsForForumId(forum.id) { (error, posts) in

            guard error == nil else {
                self.reportError(error)
                return
            }

            self.coordinatorDelegate?.introViewModel(
                self,
                didLoadForum: forum,
                andPosts: posts
            )
        }
    }

    func reportError(_ error: Error?) {

        self.viewDelegate?.introViewModel(
            self,
            failedToLoadWithError: error ?? HubChatApiClientError.Unknown
        )
    }
}
