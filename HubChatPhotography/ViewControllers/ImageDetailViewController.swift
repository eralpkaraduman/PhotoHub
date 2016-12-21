//
//  ImageDetailViewController.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

protocol ImageDetailViewControllerDelegate: class {
    func imageDetailViewControllerDidFinish(_ controller: ImageDetailViewController)
}

class ImageDetailViewController: UIViewController {

    weak var delegate: ImageDetailViewControllerDelegate?

    var imageUrl: URL!

    let largeImageView = UIImageView()
    let doneButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        // image
        largeImageView.backgroundColor = .black
        largeImageView.contentMode = .scaleAspectFit

        largeImageView.kf.indicatorType = .activity
        largeImageView.kf.indicator?.view.tintColor = .white


        view.addSubview(largeImageView)
        largeImageView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }

        // button
        doneButton.setTitle("Done", for: .normal)

        doneButton.addTarget(self, action: #selector(doneButtonDidTriggerTap), for: .touchUpInside)
        view.addSubview(doneButton)

        doneButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            make.top.equalTo(view).offset(40)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        largeImageView.kf.setImage(
            with: imageUrl,
            options: [
                .transition(.fade(0.4))
            ]
        )
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func doneButtonDidTriggerTap() {
        delegate?.imageDetailViewControllerDidFinish(self)
    }

}
