//
//  MyStatemensViewController.swift
//  rosnethub
//
//  Created by Артём Поляничев on 29.11.2020.
//

import UIKit

final class ChatListViewController: BaseViewController<ChatListView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Чат"
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? ChatListViewModel else { return }
        let input = ChatListViewModel.Input()
        let output = viewModel.transform(input)
        
        output.chats.drive(contentView.tableView.rx.items(cellIdentifier: ChatListCell.identifier,
                                                               cellType: ChatListCell.self)) { (_, viewModel, cell) in
            cell.bind(viewModel)
        }.disposed(by: disposeBag)
    }
}
