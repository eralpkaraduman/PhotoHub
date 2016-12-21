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

    var titleText: String {
        return forum.titleText
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
}
