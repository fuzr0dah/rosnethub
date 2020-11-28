//
//  LoginViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit
import RxSwift
import RxCocoa

final class LoginViewModel: BaseViewModel, ViewModelType {
    struct Input {
        let loginTapped: Driver<Void>
    }
    
    struct Output {
        let loginAction: Driver<HomeTabBarViewModel>
    }
    
    func transform(_ input: Input) -> Output {
        let login = input.loginTapped.map { HomeTabBarViewModel() }
        return Output(loginAction: login)
    }
}
