//
//  IntroViewModelProtocol.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

protocol IntroViewModelViewDelegate: class {

    func introViewModel(_ viewModel: IntroViewModel, failedToLoadWithError error: Error)
}

protocol IntroViewModelCoordinatorDelegate: class {

    func introViewModel(_ viewModel: IntroViewModel, didLoadCategory category: Category)

}

protocol IntroViewModel: class {

    weak var viewDelegate: IntroViewModelViewDelegate? { get set }
    weak var coordinatorDelegate: IntroViewModelCoordinatorDelegate? { get set }

    var titleText: String { get }

    func loadCategory()
}
