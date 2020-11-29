//
//  MyStatementsView.swift
//  rosnethub
//
//  Created by Артём Поляничев on 29.11.2020.
//

import UIKit

final class ChatListView: BaseView {
    
    // MARK: - Properties
    
    let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func prepareView() {
        super.prepareView()
        tableView.backgroundColor = backgroundColor
        tableView.tableFooterView = UIView()
        tableView.register(ChatListCell.self, forCellReuseIdentifier: ChatListCell.identifier)
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
    }
}
