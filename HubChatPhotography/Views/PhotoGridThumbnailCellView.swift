//
//  PhotoGridThumbnailCellView.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoGridThumbnailCellView: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.kf.indicatorType = .activity
    }

}
