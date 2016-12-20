//
//  Category.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

protocol Category {

    var headerImageUrl: URL { get }
    var logoImageUrl: URL { get }
    var titleText: String { get }
    var descriptionText: String { get }

    init?(withJsonObject json: Any)
}
