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

    var titleText: String {
        return "Loading HubChat Photography Forum"
    }

    func loadCategory() {
        //introViewModel(_ viewModel: IntroViewModel, failedToLoadWithError error: Error)

        viewDelegate?.introViewModel(self, failedToLoadWithError: HubChatApiClientError.Unknown)
    }
}
