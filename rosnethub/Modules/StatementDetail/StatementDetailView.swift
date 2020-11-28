//
//  StatementDetailView.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit

final class StatementDetailView: BaseView {
    
    // MARK: - Properties
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = .bold(ofSize: 16.0)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    let subtitleLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 14.0)
        return view
    }()
    
    let descLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func prepareView() {
        super.prepareView()
        addSubviews(titleLabel, subtitleLabel, descLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10.0)
            make.left.right.equalToSuperview().inset(20.0)
            make.height.greaterThanOrEqualTo(20.0)
        }
        subtitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5.0)
            make.left.right.equalToSuperview().inset(20.0)
            make.height.equalTo(20.0)
        }
        descLabel.snp.makeConstraints { (make) in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(5.0)
            make.left.right.equalToSuperview().inset(20.0)
            make.height.lessThanOrEqualTo(150.0)
        }
    }
}
