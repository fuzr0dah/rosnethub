//
//  BaseCellViewModel.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import UIKit
import RxRelay

class BaseCellViewModel {
    let title = BehaviorRelay<String?>(value: nil)
    let subtitle = BehaviorRelay<String?>(value: nil)
    let desc = BehaviorRelay<NSAttributedString?>(value: nil)
}
