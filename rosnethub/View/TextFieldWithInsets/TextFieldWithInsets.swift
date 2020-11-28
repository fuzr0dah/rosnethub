//
//  TextFieldWithInsets.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit

final class TextFieldWithInsets: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: bounds.insetBy(dx: 10.0, dy: 0.0))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return super.editingRect(forBounds: bounds.insetBy(dx: 10.0, dy: 0.0))
    }
}
