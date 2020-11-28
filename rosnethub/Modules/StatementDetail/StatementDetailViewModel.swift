//
//  StatementDetailViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit
import RxSwift
import RxCocoa

final class StatementDetailViewModel: BaseViewModel, ViewModelType {
    struct Input { }
    
    struct Output {
        
    }
    
    let statement: BehaviorRelay<Statement>
    
    init(statement: Statement) {
        self.statement = BehaviorRelay<Statement>(value: statement)
        super.init()
    }
    
    func transform(_ input: Input) -> Output {
        return Output()
    }
}
