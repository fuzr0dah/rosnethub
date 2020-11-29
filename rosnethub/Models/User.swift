//
//  User.swift
//  rosnethub
//
//  Created by Артём Поляничев on 28.11.2020.
//

import Foundation

struct User: Codable {
    let name: String
    let surname: String
    let userProfile: UserProfile
    let statements: [Statement]
}

struct UserProfile: Codable {
    let rating: Int
    let position: String
    let department: String
    let phone: String
    let experience: Int
}
