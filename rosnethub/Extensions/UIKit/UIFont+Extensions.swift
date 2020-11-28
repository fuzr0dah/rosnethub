//
//  UIFont+Extensions.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit

extension UIFont {
    static func light(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "GothamPro-Light", size: size) ?? UIFont()
    }
    
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "GothamPro", size: size) ?? UIFont()
    }
    
    static func semibold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "GothamPro-Medium", size: size) ?? UIFont()
    }
    
    static func bold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "GothamPro-Bold", size: size) ?? UIFont()
    }
}
