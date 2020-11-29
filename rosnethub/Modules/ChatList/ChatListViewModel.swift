//
//  MyStatementsViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 29.11.2020.
//

import UIKit
import RxSwift
import RxCocoa

final class ChatListViewModel: BaseViewModel, ViewModelType {
    struct Input {
    }
    
    struct Output {
        let chats: Driver<[ChatListCellViewModel]>
    }
    
    func transform(_ input: Input) -> Output {
        let items = BehaviorRelay<[ChatListCellViewModel]>(value: [])
        
        items.accept([
            ChatListCellViewModel(name: "Иван Татук", message: "Привет, как дела?"),
            ChatListCellViewModel(name: "Алла Навченко", message: "Привет, классное предложение!"),
            ChatListCellViewModel(name: "Никита Булахов", message: "Привет, я противный")
        ])
        
        return Output(chats: items.asDriver())
    }
}
