//
//  ForumViewModel.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

protocol ForumViewModelViewDelegate: class {

}

protocol ForumViewModelCoordinatorDelegate: class {
    func forumViewModel(_ viewModel: ForumViewModel, didSelectPhotoUrl url: URL)
}

protocol ForumViewModel: class {

    var forum: Forum { get set }

    weak var viewDelegate: ForumViewModelViewDelegate? { get set }
    weak var coordinatorDelegate: ForumViewModelCoordinatorDelegate? { get set }

    var headerImageUrl: URL { get }
    var logoImageUrl: URL { get }
    var titleText: String { get }
    var numberOfPosts: Int { get }
    var descriptionText: String { get }

    func postAtIndex(_ index: Int) -> Post?
    func photoGridCellViewModelAtIndex(_ index: Int) -> PhotoGridCellViewModel?
    func selectPhotoUrl(_ photoUrl: URL)
}
