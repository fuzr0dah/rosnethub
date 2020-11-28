//
//  StatementListViewController.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit

final class StatementListViewController: BaseViewController<StatementListView> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Главная"
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? StatementListViewModel else { return }
        let input = StatementListViewModel.Input()
        let output = viewModel.transform(input)
        
        output.statements.drive(contentView.tableView.rx.items(cellIdentifier: StatementListCell.identifier,
                                                               cellType: StatementListCell.self)) { (_, viewModel, cell) in
            cell.bind(viewModel)
        }.disposed(by: disposeBag)
    }
}
