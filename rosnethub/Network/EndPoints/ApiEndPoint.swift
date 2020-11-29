//
//  ApiEndPoint.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import Foundation

enum ApiEndPoint {
    case getStatements
    case getUser
}

extension ApiEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getStatements:
            return "statements"
        case .getUser:
            return "users/1"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .request
    }
}
