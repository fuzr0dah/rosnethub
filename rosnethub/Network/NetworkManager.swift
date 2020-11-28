//
//  NetworkManager.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import RxSwift

extension NetworkManager {
    struct StatementApi {
        private static let router = NetworkRouter<StatementEndPoint>()
        
        static func getStatements() -> Single<[Statement]> {
            return router.request(.getStatements, type: [Statement].self)
        }
    }
}
