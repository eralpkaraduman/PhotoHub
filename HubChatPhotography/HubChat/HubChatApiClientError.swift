//
//  HubChatApiClientError.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/20/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

enum HubChatApiClientError: Error {

    case BadResponse
    case BadStatus(status: Int)
    case Unknown
    case Internal(internalError: Error?)
}

extension HubChatApiClientError: LocalizedError {

    var errorDescription: String? {
        switch self {
        case .BadResponse:
            return "Bad Response"
        case .Unknown:
            return "Unknown"
        case let .BadStatus(status):
            return "Response was not OK: \(status)"
        case let .Internal(error):
            return "Internal Error: \((error?.localizedDescription ?? ""))"
        }
    }
}
