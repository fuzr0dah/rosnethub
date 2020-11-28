//
//  BaseTableViewCell.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import RxSwift

class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    let disposeBag = DisposeBag()
    static var identifier: String { return String(describing: type(of: self)) }
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        prepareView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    
    func prepareView() { }
    func bind(_ viewModel: BaseCellViewModel) { }
}
