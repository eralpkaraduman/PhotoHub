//
//  Post.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

protocol Post: JsonModel {

    var postId: String { get }
    var imageUrls: [URL] { get }
    var creatorUserName: String { get }
    var creatorAvatarUrl: URL { get }
    var upVotes: Int { get }
    var title: String? { get }
}
