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
        
        let chatVC = ChatListViewController(contentView: ChatListView(), viewModel: ChatListViewModel())
        chatVC.tabBarItem = UITabBarItem(title: "Чат", image: UIImage(named: "forum-outline"), tag: 1)
        
        let addStatementVC = AddStatementViewController(contentView: AddStatementView(), viewModel: AddStatementViewModel())
        addStatementVC.tabBarItem = UITabBarItem(title: "Новая заявка", image: UIImage(named: "plus-circle-outline"), tag: 2)
        
        let myStatementsVC = MyStatemensViewController(contentView: MyStatementsView(), viewModel: MyStatementsViewModel())
        myStatementsVC.tabBarItem = UITabBarItem(title: "Заявления", image: UIImage(named: "form-select"), tag: 3)
        
        let profileVC = ProfileViewController(contentView: ProfileView(), viewModel: ProfileViewModel())
        profileVC.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(named: "account-circle-outline"), tag: 4)
        
        return [statementVC, chatVC, addStatementVC, myStatementsVC, profileVC].map { UINavigationController(rootViewController: $0) }
    }
}
