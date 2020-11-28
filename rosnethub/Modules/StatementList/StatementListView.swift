//
//  StatementListView.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import SnapKit

final class StatementListView: BaseView {
    
    // MARK: - Properties
    
    let tableView = UITableView()
    
    // MARK: - Lifecycle

    override func prepareView() {
        super.prepareView()
        tableView.backgroundColor = backgroundColor
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(StatementListCell.self, forCellReuseIdentifier: StatementListCell.identifier)
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
