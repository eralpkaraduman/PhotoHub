//
//  HubChatForum.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

struct HubChatForum: Forum {

    var id: String
    var titleText: String
    var descriptionText: String
    var logoImageUrl: URL
    var headerImageUrl: URL

    init?(withJsonObject json: Any) {

        guard
        let json = json as? NSDictionary,
        let id = json.value(forKeyPath: "forum.uuid") as? String,
        let titleText = json.value(forKeyPath: "forum.title") as? String,
        let descriptionText = json.value(forKeyPath: "forum.description") as? String,
        let logoImageUrlString = json.value(forKeyPath: "forum.image.url") as? String,
        let headerImageUrlString = json.value(forKeyPath: "forum.headerImage.url") as? String,
        let logoImageUrl = URL(string: logoImageUrlString),
        let headerImageUrl = URL(string: headerImageUrlString)
        else {
            return nil
        }

        self.id = id
        self.titleText = titleText
        self.descriptionText = descriptionText
        self.logoImageUrl = logoImageUrl
        self.headerImageUrl = headerImageUrl
    }
}
