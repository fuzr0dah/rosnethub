//
//  StatementListViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import RxCocoa

final class StatementListViewModel: BaseViewModel, ViewModelType {
    struct Input { }
    
    struct Output {
        let statements: Driver<[StatementListCellViewModel]>
    }
    
    func transform(_ input: Input) -> Output {
        let items = BehaviorRelay<[StatementListCellViewModel]>(value: [])
        
        NetworkManager
            .StatementApi
            .getStatements()
            .map({ $0.map { StatementListCellViewModel(statement: $0) } })
            .subscribe(onSuccess: { viewModels in
                items.accept(viewModels)
            }).disposed(by: disposeBag)
        
        return Output(statements: items.asDriver())
    }
}
