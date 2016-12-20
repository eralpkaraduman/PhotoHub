//
//  Forum.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

protocol Forum: JsonModel {

    var headerImageUrl: URL { get }
    var logoImageUrl: URL { get }
    var titleText: String { get }
    var descriptionText: String { get }
}
