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

}

protocol ForumViewModel: class {

    var forum: Forum { get set }

    weak var viewDelegate: ForumViewModelViewDelegate? { get set }
    weak var coordinatorDelegate: ForumViewModelCoordinatorDelegate? { get set }

    var titleText: String { get }
    var numberOfPosts: Int { get }

    func postAtIndex(_ index: Int) -> Post?

}
