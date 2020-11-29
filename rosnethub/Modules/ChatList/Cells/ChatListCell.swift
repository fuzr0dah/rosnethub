//
//  ChatListCell.swift
//  rosnethub
//
//  Created by Артём Поляничев on 29.11.2020.
//

import UIKit
import SnapKit
import RxSwift

final class ChatListCell: BaseTableViewCell {
    
    // MARK: - Properties
    
    let chatImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "account-circle-outline")
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.font = .semibold(ofSize: 16.0)
        return view
    }()
    
    let subtitleLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 14.0)
        return view
    }()
    
    override func prepareView() {
        addSubviews(chatImageView, titleLabel, subtitleLabel)
        chatImageView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(10.0).priority(.high)
            make.left.equalToSuperview().offset(15.0)
            make.height.width.equalTo(50.0)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(15.0)
            make.left.equalTo(chatImageView.snp.right).offset(15.0)
            make.right.equalToSuperview().offset(-20.0)
        }
        subtitleLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-15.0)
            make.left.equalTo(chatImageView.snp.right).offset(15.0)
            make.right.equalToSuperview().offset(-20.0)
        }
    }
    
    override func bind(_ viewModel: BaseCellViewModel) {
        viewModel.title.asDriver().drive(titleLabel.rx.text).disposed(by: disposeBag)
        viewModel.subtitle.asDriver().drive(subtitleLabel.rx.text).disposed(by: disposeBag)
    }
}
