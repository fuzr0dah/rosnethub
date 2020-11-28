//
//  HomeTabBarViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import RxSwift
import RxCocoa

final class HomeTabBarViewModel: BaseViewModel, ViewModelType {
    struct Input { }
    
    struct Output {
        let viewControllers: Driver<[UIViewController]>
    }
    
    func transform(_ input: Input) -> Output {
        let items = Observable.from(optional: getViewControllers()).asDriver(onErrorJustReturn: [])
        return Output(viewControllers: items)
    }
    
    private func getViewControllers() -> [UIViewController] {
        let statementVC = StatementListViewController(contentView: StatementListView(), viewModel: StatementListViewModel())
        statementVC.tabBarItem = UITabBarItem(title: "Главная", image: UIImage(named: "home-variant-outline"), tag: 0)
        
        let addStatementVC = AddStatementViewController(contentView: AddStatementView(), viewModel: AddStatementViewModel())
        addStatementVC.tabBarItem = UITabBarItem(title: "Новая заявка", image: UIImage(named: "plus-circle-outline"), tag: 1)
        
        let profileVC = ProfileViewController(contentView: ProfileView(), viewModel: ProfileViewModel())
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "account-circle-outline"), tag: 2)
        return [statementVC, addStatementVC, profileVC].map { UINavigationController(rootViewController: $0) }
    }
}
