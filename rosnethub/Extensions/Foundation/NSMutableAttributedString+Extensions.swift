//
//  NSMutableAttributedString+Extensions.swift
//  rosnethub
//
//  Created by Артём Поляничев on 29.11.2020.
//

import UIKit

extension NSMutableAttributedString {
    func with(font: UIFont?) -> NSMutableAttributedString {
        guard let font = font else { fatalError() }
        enumerateAttribute(NSAttributedString.Key.font,
                           in: NSMakeRange(0, length),
                           options: .longestEffectiveRangeNotRequired,
                           using: { (value, range, stop) in
            if let originalFont = value as? UIFont, let newFont = applyTraitsFromFont(originalFont, to: font) {
                addAttribute(NSAttributedString.Key.font, value: newFont, range: range)
            }
        })
        
        return self
    }
    
    func applyTraitsFromFont(_ originalFont: UIFont, to newFont: UIFont) -> UIFont? {
        let originalTrait = originalFont.fontDescriptor.symbolicTraits
        
        if originalTrait.contains(.traitBold) {
            var traits = newFont.fontDescriptor.symbolicTraits
            traits.insert(.traitBold)
            
            if let fontDescriptor = newFont.fontDescriptor.withSymbolicTraits(traits) {
                return UIFont.init(descriptor: fontDescriptor, size: 0)
            }
        }
        
        return newFont
    }
}
