//
//  StatementEndPoint.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import Foundation

enum StatementEndPoint {
    case getStatements
}

extension StatementEndPoint: EndPointType {
    var path: String {
        switch self {
        case .getStatements:
            return "statements"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getStatements:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getStatements:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
