//
//  ForumHeaderView.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class ForumHeaderView: UIView {

    let logoSize: CGFloat = 90

    var viewModel: ForumViewModel? {
        didSet {
            refresh()
        }
    }

    let coverImageView = UIImageView()
    let logoImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()

    let blurEffect = UIBlurEffect(style: .dark)
    let noEffect = UIVisualEffect()
    let effectView = UIVisualEffectView()
    var centerStack: UIStackView!

    init() {
        super.init(frame: CGRect.zero)

        // cover
        coverImageView.backgroundColor = .lightGray
        coverImageView.contentMode = .scaleAspectFill

        addSubview(coverImageView)
        coverImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }

        // effect
        addSubview(effectView)
        effectView.effect = blurEffect
        effectView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }

        // logo
        logoImageView.kf.indicatorType = .activity
        logoImageView.backgroundColor = .lightGray
        logoImageView.layer.cornerRadius = logoSize / 2
        logoImageView.clipsToBounds = true
        logoImageView.layer.borderColor = UIColor.white.cgColor
        logoImageView.layer.borderWidth = 3
        logoImageView.contentMode = .scaleAspectFill

        logoImageView.snp.makeConstraints { make in
            make.width.equalTo(logoSize)
            make.height.equalTo(logoSize)
        }

        // title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center

        // description
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center

        // stack
        centerStack = UIStackView(arrangedSubviews: [
            logoImageView,
            titleLabel,
            descriptionLabel
        ])

        centerStack.axis = .vertical
        centerStack.spacing = 4
        centerStack.alignment = .center
        centerStack.distribution = .equalSpacing

        addSubview(centerStack)
        centerStack.snp.makeConstraints { make in
            make.center.equalTo(self)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(self).multipliedBy(0.8)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func refresh() {
        guard let viewModel = viewModel else { return }

        titleLabel.text = viewModel.titleText
        descriptionLabel.text = viewModel.descriptionText

        coverImageView.kf.setImage(
            with: viewModel.headerImageUrl,
            options: [
                .transition(.fade(0.4))
            ]
        )

        logoImageView.kf.setImage(
            with: viewModel.logoImageUrl,
            options: [
                .transition(.fade(0.4))
            ]
        )
    }

    // MARK: - Blur

    func setBlurApplied(_ applied: Bool) {

        UIView.animate(withDuration: 0.4) {
            if applied {
                self.effectView.effect = self.blurEffect
                self.centerStack.alpha = 1
            } else {
                self.effectView.effect = self.noEffect
                self.centerStack.alpha = 0
            }
        }
    }
}
