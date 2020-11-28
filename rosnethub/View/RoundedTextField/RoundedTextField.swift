//
//  RoundedTextField.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit

final class RoundedTextField: TextFieldWithInsets {
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.systemGray3.cgColor
        layer.cornerRadius = 10.0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
