//
//  PhotoGridCellViewModel.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

class PhotoGridCellViewModel {

    let post: Post

    init(post: Post) {
        self.post = post
    }

    var avatarImageUrl: URL {
        return post.creatorAvatarUrl
    }

    var creatorUserName: String {
        return post.creatorUserName
    }

    var titleText: String? {
        return post.title
    }

    var upvoteCountText: String {
        return String(post.upVotes)
    }

}
