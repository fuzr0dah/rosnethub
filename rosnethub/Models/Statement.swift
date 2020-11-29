//
//  Statement.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import Foundation

struct Statement: Codable {
    let name: String
    let author: Author?
    let projectDescription: String
    let createdAt: Int
    let upvotes: Int
}

struct Author: Codable {
    let id: Int
    let fIO: String
}
