//
//  ChatListCellViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 29.11.2020.
//

import UIKit

final class ChatListCellViewModel: BaseCellViewModel {
    init(name: String, message: String) {
        super.init()
        
        title.accept(name)
        subtitle.accept(message)
    }
}
