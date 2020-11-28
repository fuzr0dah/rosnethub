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
    
    let likesLabel: UILabel = {
        let view = UILabel()
        view.font = .semibold(ofSize: 12.0)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    let likeButton: UIButton = {
        let view = UIButton()
        view.tintColor = .black
        return view
    }()
    
    let commentsLabel: UILabel = {
        let view = UILabel()
        view.font = .semibold(ofSize: 12.0)
        return view
    }()
    
    let commentButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "forum-outline"), for: .normal)
        return view
    }()
    
    private let actionsContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func prepareView() {
        actionsContainer.addSubviews(likesLabel, likeButton, commentsLabel, commentButton)
        addSubviews(titleLabel, subtitleLabel, descLabel, actionsContainer)
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
        actionsContainer.snp.makeConstraints { (make) in
            make.top.equalTo(descLabel.snp.bottom).offset(10.0)
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(40.0)
        }
        
        likeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10.0)
            make.left.equalToSuperview().offset(20.0)
            make.height.width.equalTo(20.0)
        }
        likesLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(likeButton.snp.centerY)
            make.left.equalTo(likeButton.snp.right).offset(5.0)
            make.height.equalTo(18.0)
            make.width.greaterThanOrEqualTo(30.0)
        }
        commentButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10.0)
            make.left.equalTo(likesLabel.snp.right).offset(20.0)
            make.height.width.equalTo(20.0)
        }
        commentsLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(commentButton.snp.centerY)
            make.left.equalTo(commentButton.snp.right).offset(5.0)
            make.height.equalTo(18.0)
            make.width.greaterThanOrEqualTo(30.0)
        }
    }
    
    override func bind(_ viewModel: BaseCellViewModel) {
        guard let viewModel = viewModel as? StatementListCellViewModel else { return }
        
        viewModel.title.asDriver().drive(titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.subtitle.asDriver().drive(subtitleLabel.rx.text).disposed(by: disposeBag)
        viewModel.desc.asDriver().drive(descLabel.rx.attributedText).disposed(by: disposeBag)
        viewModel.liked.asDriver().drive(likeButton.rx.image()).disposed(by: disposeBag)
        viewModel.likes.asDriver().drive(likesLabel.rx.text).disposed(by: disposeBag)
        viewModel.comments.asDriver().drive(commentsLabel.rx.text).disposed(by: disposeBag)
    }
}
