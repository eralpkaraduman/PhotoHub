//
//  ForumViewController.swift
//  HubChatPhotography
//
//  Created by Eralp Karaduman on 12/21/16.
//  Copyright © 2016 Super Damage. All rights reserved.
//

import UIKit
import SnapKit

class ForumPhotoGridViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var headerView = ForumHeaderView()
    let headerHeight: CGFloat = 250
    var headerViewTopConstraint: Constraint!
    var headerViewHeightConstraint: Constraint!

    let statusBarHeight: CGFloat = 20

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
        tableView.estimatedRowHeight = 200
        tableView.dataSource = self
        tableView.delegate = self

        view.addSubview(headerView)

        headerView.isUserInteractionEnabled = false

        headerView.snp.makeConstraints { make in
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            headerViewHeightConstraint = make.height.equalTo(headerHeight).constraint
            headerViewTopConstraint = make.top.equalTo(view).constraint
        }

        tableView.contentInset = UIEdgeInsets(
            top: headerHeight - statusBarHeight,
            left: 0, bottom: 0, right: 0
        )

        refreshView()
    }

    fileprivate func updateHeaderLayout() {

        let offset = -(tableView.contentOffset.y + tableView.contentInset.top)
        var topConstraintOffset = offset
        var heightConstraintOffset = headerHeight
        if offset > 0 {
            topConstraintOffset = 0
            heightConstraintOffset.add(offset)

            headerView.setBlurApplied(false)

        } else {

            headerView.setBlurApplied(true)
        }

        headerViewTopConstraint.update(offset: topConstraintOffset)
        headerViewHeightConstraint.update(offset: heightConstraintOffset)

        headerView.layoutIfNeeded()
    }
}

extension ForumPhotoGridViewController: ForumViewModelViewDelegate {

    func refreshView() {
        guard isViewLoaded else { return }

        headerView.viewModel = viewModel
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

        cellView.viewModel = viewModel?.photoGridCellViewModelAtIndex(indexPath.row)

        return cellView
    }
}

extension ForumPhotoGridViewController: UITableViewDelegate {

}

extension ForumPhotoGridViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        updateHeaderLayout()
    }

}
