//
//  ForumViewController.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit

class ForumPhotoGridViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let cellReuseIdentifier = "photoGridCell"

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var viewModel: ForumViewModel? {

        willSet {
            viewModel?.viewDelegate = nil
        }

        didSet {
            viewModel?.viewDelegate = self
            refreshView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140

        tableView.dataSource = self

        refreshView()
    }
}

extension ForumPhotoGridViewController: ForumViewModelViewDelegate {

    func refreshView() {
        guard isViewLoaded else { return }
        guard let viewModel = viewModel else { return }

        tableView.reloadData()
    }
}

extension ForumPhotoGridViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfPosts ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cellView = tableView.dequeueReusableCell(
            withIdentifier: cellReuseIdentifier,
            for: indexPath
        ) as? PhotoGridCellView else {
            fatalError()
        }

        if let post = viewModel?.postAtIndex(indexPath.row) {

            cellView.viewModel = PhotoGridCellViewModel(post: post)
        }

        return cellView
    }
}
