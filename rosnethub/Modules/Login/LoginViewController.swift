//
//  LoginViewController.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit

final class LoginViewController: BaseViewController<LoginView> {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Вход"
    }
    
    override func bindViewModel() {
        guard let viewModel = viewModel as? LoginViewModel else { return }
        let input = LoginViewModel.Input(loginTapped: contentView.loginButton.rx.tap.asDriver())
        let output = viewModel.transform(input)
        
        output.loginAction.drive(onNext: { [weak self] (viewModel) in
            let vc = HomeTabBarController(viewModel: viewModel)
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
}
