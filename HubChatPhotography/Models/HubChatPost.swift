//
//  HubChatPost.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

struct HubChatPost: Post {

    var id: String
    var imageUrls: [URL]
    var creatorUserName: String
    var creatorAvatarUrl: URL
    var upVotes: Int = 0
    var title: String?

    init?(withJsonObject json: Any) {

        guard
        let json = json as? NSDictionary,
        let id = json.value(forKeyPath: "id") as? String,
        let images = json.value(forKeyPath: "entities.images") as? [NSDictionary],
        let creatorUserName = json.value(forKeyPath: "createdBy.username") as? String,
        let creatorAvatarUrlString = json.value(forKeyPath: "createdBy.avatar.url") as? String,
        let creatorAvatarUrl = URL(string: creatorAvatarUrlString)
        else { return nil }

        self.id = id

        title = json.value(forKeyPath: "rawContent") as? String

        self.imageUrls = images.flatMap {
            if let urlString = $0["cdnUrl"] as? String {
                return URL(string: urlString)
            }
            return nil
        }

        self.creatorUserName = creatorUserName
        self.creatorAvatarUrl = creatorAvatarUrl

        if let upVotes = json.value(forKeyPath: "stats.upVotes") as? Int {
            self.upVotes = upVotes
        }
    }
}
