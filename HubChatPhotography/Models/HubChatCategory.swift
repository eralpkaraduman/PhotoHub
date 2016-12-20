//
//  HubChatCategory.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

struct HubChatCategory: Category {

    var headerImageUrl: URL
    var logoImageUrl: URL
    var titleText: String
    var descriptionText: String

    init?(withJsonObject json: Any) {
        return nil
    }
}
