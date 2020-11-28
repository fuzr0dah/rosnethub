//
//  UIView+Extensions.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
