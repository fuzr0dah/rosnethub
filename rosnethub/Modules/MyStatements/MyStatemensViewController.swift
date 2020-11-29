//
//  MyStatemensViewController.swift
//  rosnethub
//
//  Created by Артём Поляничев on 29.11.2020.
//

import UIKit

final class MyStatemensViewController: BaseViewController<MyStatementsView> {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Заявления"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let index = contentView.tableView.indexPathForSelectedRow {
            contentView.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? MyStatementsViewModel else { return }
        let input = MyStatementsViewModel
            .Input(selectionStatement: contentView.tableView.rx.modelSelected(StatementListCellViewModel.self).asDriver())
        let output = viewModel.transform(input)
        
        output.statements.drive(contentView.tableView.rx.items(cellIdentifier: StatementListCell.identifier,
                                                               cellType: StatementListCell.self)) { (_, viewModel, cell) in
            cell.bind(viewModel)
        }.disposed(by: disposeBag)
        
        output.selectedStatement.drive(onNext: { [weak self] (viewModel) in
            let vc = StatementDetailViewController(contentView: StatementDetailView(), viewModel: viewModel)
            vc.hidesBottomBarWhenPushed = true
            self?.navigationController?.pushViewController(vc, animated: true)
        }).disposed(by: disposeBag)
    }
}
