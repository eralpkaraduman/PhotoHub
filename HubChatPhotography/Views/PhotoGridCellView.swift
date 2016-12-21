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

    let thumbnailReuseIdentifier = "thumbnailCell"
    let gridHorizontalInset: CGFloat = 12

    @IBOutlet weak var creatorUsernameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var upvoteCountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var gridContainerView: UIView!

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

        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.contentInset = UIEdgeInsets(
            top: 0, left: 0,
            bottom: 0, right: gridHorizontalInset
        )
    }

    fileprivate func refreshView() {
        guard let viewModel = viewModel else { return }

        creatorUsernameLabel.text = viewModel.creatorUserName
        titleLabel.text = viewModel.titleText
        upvoteCountLabel.text = viewModel.upvoteCountText

        avatarImageView.kf.setImage(
            with: viewModel.avatarImageUrl,
            options: [
                .transition(.fade(0.4))
            ]
        )

        gridContainerView.isHidden = (viewModel.numberOfPhotos == 0)

        collectionView.setContentOffset(CGPoint.zero, animated: false)
        collectionView.reloadData()
    }

}

extension PhotoGridCellView: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {

        return viewModel?.numberOfPhotos ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {

        guard let cellView = collectionView.dequeueReusableCell(
            withReuseIdentifier: thumbnailReuseIdentifier,
            for: indexPath
        ) as? PhotoGridThumbnailCellView else {
            fatalError()
        }

        cellView.imageView.kf.setImage(
            with: viewModel?.photoUrlAtIndex(indexPath.item),
            options: [
                .transition(.fade(0.4))
            ]
        )

        return cellView
    }

}

extension PhotoGridCellView: UICollectionViewDelegate {

}
