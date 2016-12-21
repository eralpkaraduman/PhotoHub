//
//  HubChatPhotoGridCellViewModel.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import Foundation

class HubChatPhotoGridCellViewModel: PhotoGridCellViewModel {

    weak var delegate: PhotoGridCellViewModelDelegate?

    var post: Post

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

    var numberOfPhotos: Int {
        return post.imageUrls.count
    }

    func photoUrlAtIndex(_ index: Int) -> URL? {

        guard 0 ..< numberOfPhotos ~= index else {
            return nil
        }

        return post.imageUrls[index]
    }

    func thumbnailUrlAtIndex(_ index: Int) -> URL? {

        return photoUrlAtIndex(index)
    }

    func selectPhotoAtIndex(_ index: Int) {
        delegate?.photoGridCellViewModel(self, didSelectPhotoAtIndex: index)
    }
}
