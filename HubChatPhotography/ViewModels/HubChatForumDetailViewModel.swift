//
//  HubChatForumDetailViewModel.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

class HubChatForumDetailViewModel: ForumViewModel {

    weak var coordinatorDelegate: ForumViewModelCoordinatorDelegate?
    weak var viewDelegate: ForumViewModelViewDelegate?

    var forum: Forum
    var posts: [Post]

    init(forum: Forum, posts: [Post]) {
        self.forum = forum
        self.posts = posts
    }

    var headerImageUrl: URL {
        return forum.headerImageUrl
    }

    var logoImageUrl: URL {
        return forum.logoImageUrl
    }

    var titleText: String {
        return forum.titleText
    }

    var descriptionText: String {
        return forum.descriptionText
    }

    var numberOfPosts: Int {
        return posts.count
    }

    func postAtIndex(_ index: Int) -> Post? {

        guard 0 ..< numberOfPosts ~= index else {
            return nil
        }

        return posts[index]
    }

    func photoGridCellViewModelAtIndex(_ index: Int) -> PhotoGridCellViewModel? {

        if let post = postAtIndex(index) {
            return HubChatPhotoGridCellViewModel(post: post)
        }

        return nil
    }
}
