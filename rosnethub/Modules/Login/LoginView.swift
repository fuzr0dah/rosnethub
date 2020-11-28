//
//  LoginView.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit
import SnapKit

final class LoginView: BaseView {
    
    // MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "logo")
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Вход"
        view.font = .semibold(ofSize: 32.0)
        view.textAlignment = .center
        return view
    }()
    
    private let fieldsContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10.0
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.systemGray4.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.1
        return view
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
        }
        return view
    }()
    
    let loginField: TextFieldWithInsets = {
        let view = TextFieldWithInsets()
        view.placeholder = "Логин"
        return view
    }()
    
    let passwordField: TextFieldWithInsets = {
        let view = TextFieldWithInsets()
        view.placeholder = "Пароль"
        view.isSecureTextEntry = true
        return view
    }()
    
    let loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Войти", for: .normal)
        view.titleLabel?.font = .semibold(ofSize: 18.0)
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 25.0
        return view
    }()
    
    // MARK: - Lifecycle

    override func prepareView() {
        super.prepareView()
        let stackView = UIStackView(arrangedSubviews: [loginField, separatorView, passwordField])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.spacing = 1.0
        
        fieldsContainer.addSubview(stackView)
        addSubviews(logoImageView, titleLabel, fieldsContainer, loginButton)
        
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide).offset(20.0)
            make.left.right.equalToSuperview().inset(40.0)
            make.height.equalTo(120.0)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(20.0)
            make.left.right.equalToSuperview().inset(20.0)
            make.height.equalTo(36.0)
        }
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        fieldsContainer.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(20.0)
            make.left.right.equalTo(safeAreaLayoutGuide).inset(20.0)
        }
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(fieldsContainer.snp.bottom).offset(20.0)
            make.left.right.equalToSuperview().inset(20.0)
            make.height.equalTo(50.0)
        }
    }
}
