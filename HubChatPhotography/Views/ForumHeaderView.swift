//
//  ForumHeaderView.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit
import SnapKit

class ForumHeaderView: UIView {

    let coverImageView = UIImageView()

    init() {
        super.init(frame: CGRect.zero)

        isUserInteractionEnabled = false

        coverImageView.backgroundColor = .blue

        addSubview(coverImageView)

        coverImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }


    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
