//
//  Network.swift
//  rosnethub
//
//  Created by Артём Поляничев on 27.11.2020.
//

import Foundation
import RxSwift

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void
public typealias HTTPHeaders = [String: String]
public typealias NetworkParameters = [String: Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: NetworkParameters) throws
}

public enum EncoderError: String, Error {
    case missingUrl = "Url == nil"
    case missingParameters = "Parameters == nil"
    case encodingFailed = "Encoding failed"
}

// MARK: - URLParameterEncoder

public struct URLParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: NetworkParameters) throws {
        guard let url = urlRequest.url else { throw EncoderError.missingUrl }
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty else {
            throw EncoderError.encodingFailed
        }
        
        urlComponents.queryItems = [URLQueryItem]()
        for (name, value) in parameters {
            let item = URLQueryItem(name: name, value: "'\(value)'".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed))
            urlComponents.queryItems?.append(item)
        }
        urlRequest.url = urlComponents.url
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        }
    }
}

// MARK: - JSONParameterEncoder

public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: NetworkParameters) throws {
        do {
            let json = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = json
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw EncoderError.encodingFailed
        }
    }
}

// MARK: - EndPointType

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

extension EndPointType {
    var baseURL: URL {
        guard let url = URL(string: "http://35.204.149.56/rosseti-backend/public/api") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var headers: HTTPHeaders? {
        return ["Authorization": "Bearer 123"] // Simulate auth
    }
}

// MARK: - HTTPMethod

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

// MARK: - HTTPTask

public enum HTTPTask {
    case request
    case requestWithParameters(_ urlParameters: NetworkParameters?, bodyParameters: NetworkParameters?)
    case requestWithParametersAndHeaders(_ urlParameters: NetworkParameters?, bodyParameters: NetworkParameters?, headers: HTTPHeaders?)
}

// MARK: - NetworkRouter

final class NetworkRouter<EndPoint: EndPointType> {
    func request<Model: Codable>(_ route: EndPoint, type: Model.Type) -> Single<Model> {
        let session = URLSession.shared
        let urlSingle = Single<Model>.create { single in
            guard let request = try? self.buildRequest(from: route) else { fatalError() }
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    single(.failure(error))
                } else if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(type, from: data)
                        single(.success(decodedData))
                    } catch {
                        print(error)
                        single(.failure(ResponseDecoderError.failDecode))
                    }
                }
            }
            
            dataTask.resume()
            
            return Disposables.create {
                dataTask.cancel()
            }
        }
        return urlSingle
    }
    
    private func buildRequest(from route: EndPoint) throws -> URLRequest {
        var request = URLRequest(url: route.baseURL.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        request.httpMethod = route.httpMethod.rawValue
        switch route.task {
        case .request:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .requestWithParameters(let urlParameters, let bodyParameters):
            try configureParameters(request: &request, bodyParameters: bodyParameters, urlParameters: urlParameters)
        case .requestWithParametersAndHeaders(let urlParameters, let bodyParameters, let headers):
            addHeaders(request: &request, headers: headers)
            try configureParameters(request: &request, bodyParameters: bodyParameters, urlParameters: urlParameters)
        }
        
        return request
    }
    
    private func configureParameters(request: inout URLRequest,
                                     bodyParameters: NetworkParameters?,
                                     urlParameters: NetworkParameters?) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, with: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    private func addHeaders(request: inout URLRequest, headers: HTTPHeaders?) {
        guard let headers = headers else { return }
        for (name, value) in headers {
            request.setValue(value, forHTTPHeaderField: name)
        }
    }
}

// MARK: - Decoder

enum ResponseDecoderError: Error {
    case failDecode
}

// MARK: - NetworkManager

struct NetworkManager {
    private init() { }
}
