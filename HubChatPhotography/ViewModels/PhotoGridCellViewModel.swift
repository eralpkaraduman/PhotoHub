//
//  PhotoGridCellViewModel.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

protocol PhotoGridCellViewModel {

    var avatarImageUrl: URL { get }
    var creatorUserName: String { get }
    var titleText: String? { get }
    var upvoteCountText: String { get }
    var numberOfPhotos: Int { get }

    func photoUrlAtIndex(_ index: Int) -> URL?
    func thumbnailUrlAtIndex(_ index: Int) -> URL?
}
