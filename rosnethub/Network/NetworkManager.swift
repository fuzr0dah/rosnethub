//
//  NetworkManager.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import RxSwift

extension NetworkManager {
    struct StatementApi {
        private static let router = NetworkRouter<ApiEndPoint>()
        
        static func getAllStatements() -> Single<[Statement]> {
            return router.request(.getStatements, type: [Statement].self)
        }
        
        static func getUser() -> Single<User> {
            return router.request(.getUser, type: User.self)
        }
    }
}
