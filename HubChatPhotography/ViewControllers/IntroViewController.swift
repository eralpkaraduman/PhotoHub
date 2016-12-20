//
//  IntroViewController.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/19/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    var viewModel: IntroViewModel? {

        willSet {
            viewModel?.viewDelegate = nil
        }

        didSet {
            viewModel?.viewDelegate = self
            refreshView()
        }
    }

    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        refreshView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewModel?.loadForum()
    }

    // MARK: - ViewController Configuration

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - User Interactions

    fileprivate func showLoadFailedAlertForError(_ error: Error) {

        let alertController = UIAlertController(
            title: "Error",
            message: error.localizedDescription,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "OK", style: .default) { _ in

            self.viewModel?.loadForum()
        }

        alertController.addAction(action)

        self.present(alertController, animated: true, completion: nil)

    }

    func refreshView() {

        guard isViewLoaded else { return }

        guard let viewModel = viewModel else { return }

        titleLabel.text = viewModel.titleText
    }
}

extension IntroViewController: IntroViewModelViewDelegate {

    func introViewModel(_ viewModel: IntroViewModel, failedToLoadWithError error: Error) {
        showLoadFailedAlertForError(error)
    }
}
