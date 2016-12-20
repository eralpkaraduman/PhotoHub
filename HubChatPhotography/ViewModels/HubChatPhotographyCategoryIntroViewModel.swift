//
//  IntroViewModel.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

class HubChatPhotographyCategoryIntroViewModel: IntroViewModel {

    weak var coordinatorDelegate: IntroViewModelCoordinatorDelegate?
    weak var viewDelegate: IntroViewModelViewDelegate?

    var fetchForumTask: URLSessionTask? = nil

    var titleText: String {
        return "Loading HubChat Photography Forum"
    }

    func loadCategory() {

        fetchForumTask = HubChatApiClient.shared.fetchForum(.photography) { (error, forum) in

            guard let forum = forum, error == nil else {

                self.viewDelegate?.introViewModel(
                    self,
                    failedToLoadWithError: error ?? HubChatApiClientError.Unknown
                )

                return
            }

            print(forum)

        }

    }
}
