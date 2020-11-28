//
//  ProfileView.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit
import SnapKit

final class ProfileView: BaseView {
    
    // MARK: - Properties
    
    let profileImageView: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "camera",
                              withConfiguration: UIImage.SymbolConfiguration(pointSize: 40.0, weight: .regular, scale: .default)), for: .normal)
        view.tintColor = .black
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 50.0
        return view
    }()
    
    let nameLabel: UILabel = {
        let view = UILabel()
        view.font = .semibold(ofSize: 20.0)
        view.textAlignment = .center
        view.text = "Иванов Иван Иванович"
        return view
    }()
    
    let positionLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 16.0)
        view.textAlignment = .center
        view.text = "UI/UX Дизайнер"
        return view
    }()
    
    let companyLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 16.0)
        view.textAlignment = .center
        view.text = "Инфоком"
        return view
    }()
    
    let ratingLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 16.0)
        view.textAlignment = .center
        view.text = "2102"
        return view
    }()
    
    let statementsLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 16.0)
        view.textAlignment = .center
        view.text = "34"
        return view
    }()
    
    // MARK: - Lifecycle

    override func prepareView() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, positionLabel, companyLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 5.0
        
        
        addSubviews(profileImageView, stackView)
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(20.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(100.0)
            make.width.equalTo(profileImageView.snp.height).multipliedBy(1.0)
        }
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(20.0)
            make.left.right.equalToSuperview().inset(20.0)
        }
    }
}
