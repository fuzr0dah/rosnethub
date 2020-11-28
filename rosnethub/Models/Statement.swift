//
//  Statement.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import Foundation

struct Statement: Codable {
    let name: String
    let author: User
    let projectDescription: String
    let createdAt: Int
}
