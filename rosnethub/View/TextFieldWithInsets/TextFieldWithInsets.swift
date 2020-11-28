//
//  TextFieldWithInsets.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit
import SnapKit

class TextFieldWithInsets: UITextField {
    
    // MARK: - Properties
    
    private let fieldsHeight = 48.0
    
    // MARK: - Text Rect
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: bounds.insetBy(dx: 10.0, dy: 0.0))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return super.editingRect(forBounds: bounds.insetBy(dx: 10.0, dy: 0.0))
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        snp.makeConstraints { (make) in
            make.height.equalTo(fieldsHeight)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
