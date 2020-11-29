//
//  MyStatementsViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 29.11.2020.
//

import UIKit
import RxSwift
import RxCocoa

final class MyStatementsViewModel: BaseViewModel, ViewModelType {
    struct Input {
        let selectionStatement: Driver<StatementListCellViewModel>
    }
    
    struct Output {
        let statements: Driver<[StatementListCellViewModel]>
        let selectedStatement: Driver<StatementDetailViewModel>
    }
    
    func transform(_ input: Input) -> Output {
        let items = BehaviorRelay<[StatementListCellViewModel]>(value: [])
        
        NetworkManager
            .StatementApi
            .getUser()
            .map({ $0.statements.map { StatementListCellViewModel(statement: $0) } })
            .subscribe(onSuccess: { viewModels in
                items.accept(viewModels)
            }).disposed(by: disposeBag)
        
        let statementDetail = input.selectionStatement.map { (cellViewModel) -> StatementDetailViewModel in
            let viewModel = StatementDetailViewModel(statement: cellViewModel.statement)
            return viewModel
        }
        
        return Output(statements: items.asDriver(), selectedStatement: statementDetail)
    }
}
