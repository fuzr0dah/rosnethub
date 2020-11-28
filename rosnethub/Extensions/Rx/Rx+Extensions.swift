//
//  Rx+Extensions.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import RxCocoa

extension SharedSequence {
    public func unwrap<Result>() -> SharedSequence<SharingStrategy, Result> where Element == Result? {
        return self.filter { $0 != nil }.map { $0! }
    }
}
