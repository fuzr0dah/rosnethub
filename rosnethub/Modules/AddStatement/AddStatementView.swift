//
//  AddStatementView.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit
import SnapKit

final class AddStatementView: BaseView {
    
    // MARK: - Properties
    
    private let descPlaceholder = "Описание заявки"
    
    let nameField: RoundedTextField = {
        let view = RoundedTextField()
        view.placeholder = "Название заявки"
        view.font = .regular(ofSize: 14.0)
        return view
    }()
    
    let descField: RoundedTextView = {
        let view = RoundedTextView()
        view.text = "Описание заявки"
        view.textColor = .systemGray3
        view.font = .regular(ofSize: 14.0)
        return view
    }()
    
    override func prepareView() {
        super.prepareView()
        descField.delegate = self
        addSubviews(nameField, descField)
        nameField.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(safeAreaLayoutGuide).inset(20.0)
        }
        descField.snp.makeConstraints { (make) in
            make.top.equalTo(nameField.snp.bottom).offset(10.0)
            make.left.right.equalToSuperview().inset(20.0)
            make.height.equalTo(150.0)
        }
    }
}

// MARK: - UITextViewDelegate

extension AddStatementView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == descPlaceholder {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = descPlaceholder
            textView.textColor = .systemGray3
        }
    }
}
