//
//  RoundedTextView.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import UIKit
import SnapKit

final class RoundedTextView: UITextView {
    
    // MARK: - Init
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.systemGray3.cgColor
        layer.cornerRadius = 10.0
        textContainerInset = UIEdgeInsets(top: 10.0, left: 5.0, bottom: 10.0, right: 5.0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
