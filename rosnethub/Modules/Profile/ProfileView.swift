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
        view.font = .bold(ofSize: 20.0)
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
        view.font = .semibold(ofSize: 16.0)
        view.textAlignment = .center
        view.text = "2102"
        return view
    }()
    
    let ratingImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star")
        view.snp.makeConstraints { $0.size.equalTo(20.0) }
        return view
    }()
    
    let expLabel: UILabel = {
        let view = UILabel()
        view.font = .semibold(ofSize: 16.0)
        view.textAlignment = .center
        view.text = "1.5 года"
        return view
    }()
    
    let expImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "hand.thumbsup")
        view.snp.makeConstraints { $0.size.equalTo(20.0) }
        return view
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray2
        return view
    }()
    
    let phoneLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 16.0)
        view.text = "Номер телефона: +7 (800) 555-35-35"
        return view
    }()
    
    let bornDateLabel: UILabel = {
        let view = UILabel()
        view.font = .regular(ofSize: 16.0)
        view.text = "Дата рождения: 02.09.1951"
        return view
    }()
    
    // MARK: - Lifecycle

    override func prepareView() {
        let topLabelsStackView = UIStackView(arrangedSubviews: [nameLabel, positionLabel, companyLabel])
        topLabelsStackView.axis = .vertical
        topLabelsStackView.distribution = .equalSpacing
        topLabelsStackView.alignment = .fill
        topLabelsStackView.spacing = 5.0
        
        let infoStackView = UIStackView(arrangedSubviews: [ratingImage, ratingLabel, expImage, expLabel])
        infoStackView.axis = .horizontal
        infoStackView.distribution = .fillProportionally
        infoStackView.alignment = .center
        infoStackView.spacing = 10.0
        
        let dataStackView = UIStackView(arrangedSubviews: [phoneLabel, bornDateLabel])
        dataStackView.axis = .vertical
        dataStackView.distribution = .equalSpacing
        dataStackView.alignment = .fill
        dataStackView.spacing = 20.0
        
        addSubviews(profileImageView, topLabelsStackView, infoStackView, separatorView, dataStackView)
        profileImageView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(20.0)
            make.centerX.equalToSuperview()
            make.height.equalTo(100.0)
            make.width.equalTo(profileImageView.snp.height).multipliedBy(1.0)
        }
        topLabelsStackView.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(20.0)
            make.left.right.equalToSuperview().inset(20.0)
        }
        infoStackView.snp.makeConstraints { (make) in
            make.top.equalTo(topLabelsStackView.snp.bottom).offset(20.0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        separatorView.snp.makeConstraints { (make) in
            make.top.equalTo(infoStackView.snp.bottom).offset(20.0)
            make.left.right.equalToSuperview().inset(20.0)
            make.height.equalTo(0.5)
        }
        dataStackView.snp.makeConstraints { (make) in
            make.top.equalTo(separatorView.snp.bottom).offset(20.0)
            make.left.right.equalToSuperview().inset(20.0)
        }
    }
}
