//
//  JsonModel.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

protocol JsonModel {
    init?(withJsonObject json: Any)
}
