//
//  StatementListCell.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import RxSwift
import SnapKit

final class StatementListCell: BaseTableViewCell {
    
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
    
    let ratingLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 14.0)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    let likeButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func prepareView() {
        addSubviews(titleLabel, subtitleLabel, descLabel, ratingLabel)
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
            make.height.greaterThanOrEqualTo(24.0)
        }
        ratingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descLabel.snp.bottom).offset(10.0)
            make.bottom.left.right.equalToSuperview().inset(20.0)
        }
    }
    
    override func bind(_ viewModel: BaseCellViewModel) {
        viewModel.title.asDriver().drive(titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.subtitle.asDriver().drive(subtitleLabel.rx.text).disposed(by: disposeBag)
        viewModel.desc.asDriver().drive(descLabel.rx.attributedText).disposed(by: disposeBag)
    }
}
