//
//  StatementListCellViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import RxSwift
import RxRelay

final class StatementListCellViewModel: BaseCellViewModel {
    let likes = BehaviorRelay<String?>(value: nil)
    let liked = BehaviorRelay<UIImage?>(value: nil)
    let comments = BehaviorRelay<String?>(value: nil)
    
    let statement: Statement
    
    init(statement: Statement) {
        self.statement = statement
        super.init()
        
        title.accept(statement.name)
        subtitle.accept("\(statement.author.surname) \(statement.author.surname) • \(statement.createdAt.timestampToString())")
        if let descData = statement.projectDescription.data(using: .utf16, allowLossyConversion: true) {
            desc.accept(try? NSAttributedString(data: descData,
                                                options: [.documentType: NSAttributedString.DocumentType.html],
                                                documentAttributes: nil))
        }
        likes.accept("\(statement.upvotes)")
        liked.accept(Bool.random() ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart"))
        comments.accept("\(Int.random(in: 0...150))")
    }
}
