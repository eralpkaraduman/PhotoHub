//
//  PhotoGridCellView.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

class PhotoGridCellView: UITableViewCell {

    @IBOutlet weak var creatorUsernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!

    var viewModel: PhotoGridCellViewModel? {
        didSet {
            refreshView()
        }
    }

    //var viewModel:

    override func awakeFromNib() {
        super.awakeFromNib()

        avatarImageView.layer.cornerRadius = 20
        avatarImageView.clipsToBounds = true
    }

    fileprivate func refreshView() {
        guard let viewModel = viewModel else { return }

        creatorUsernameLabel.text = viewModel.creatorUserName
    }
    
}
