//
//  HomeTabBarController.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import RxSwift

final class HomeTabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private let disposeBag = DisposeBag()
    private var viewModel: HomeTabBarViewModel?
    
    // MARK: - Init and lifecycle
    
    init(viewModel: BaseViewModel) {
        self.viewModel = viewModel as? HomeTabBarViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        bindViewModel()
    }
    
    // MARK: - Bind
    
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        let input = HomeTabBarViewModel.Input()
        let output = viewModel.transform(input)
        
        output.viewControllers.delay(.milliseconds(50)).drive(onNext: { [weak self] (controllers) in
            self?.setViewControllers(controllers, animated: false)
        }).disposed(by: disposeBag)
    }
}
