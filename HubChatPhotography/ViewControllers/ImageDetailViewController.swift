//
//  ImageDetailViewController.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit
import SnapKit

protocol ImageDetailViewControllerDelegate: class {
    func imageDetailViewControllerDidFinish(_ controller: ImageDetailViewController)
}

class ImageDetailViewController: UIViewController {

    weak var delegate: ImageDetailViewControllerDelegate?

    var imageUrl: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black

        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)

        doneButton.addTarget(self, action: #selector(doneButtonDidTriggerTap), for: .touchUpInside)
        view.addSubview(doneButton)

        doneButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(20)
            make.top.equalTo(view).offset(40)
        }
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
