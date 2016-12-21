//
//  PhotoGridCellView.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoGridCellView: UITableViewCell {

    @IBOutlet weak var creatorUsernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    var viewModel: PhotoGridCellViewModel? {
        didSet {
            refreshView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        avatarImageView.layer.cornerRadius = 20
        avatarImageView.clipsToBounds = true
        avatarImageView.kf.indicatorType = .activity
    }

    fileprivate func refreshView() {
        guard let viewModel = viewModel else { return }

        creatorUsernameLabel.text = viewModel.creatorUserName
        avatarImageView.kf.setImage(
            with: viewModel.avatarImageUrl,
            options: [
                .transition(.fade(0.4))
            ]
        )
    }
    
}
