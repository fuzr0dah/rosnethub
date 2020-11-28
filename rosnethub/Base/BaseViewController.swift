//
//  BaseViewController.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import RxSwift
import RxRelay

class BaseViewController<View: UIView>: UIViewController {
    let disposeBag = DisposeBag()
    var contentView: View
    var viewModel: BaseViewModel
    
    init(contentView: @escaping @autoclosure () -> View, viewModel: BaseViewModel) {
        self.contentView = contentView()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = contentView
        view.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavigationBar()
        bindViewModel()
    }
    
    func bindViewModel() { }
    
    private func configNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.largeTitleTextAttributes = [.font: UIFont.semibold(ofSize: 34.0)]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        navigationController?.navigationBar.layer.shadowOpacity = 0.05
    }
}
