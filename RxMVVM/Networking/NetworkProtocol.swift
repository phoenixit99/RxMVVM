//
//  ServicesProtocol.swift
//  RxMVVM
//
//  Created by NguyenHoang on 8/14/21.
//

import UIKit

enum ParametersEncoding {
    case json
    case plain
}

typealias Parameters = [String: Any]

enum Task {
    case requestParameter(Parameters)
    case requestPlain
}
enum HeaderConfig: String {
    case rapidapHost = "weatherapi-com.p.rapidapi.com"
    case rapidapKey = "4c4983caccmshda7dfa29eca9e41p1fc96fjsn1756d02696fe"
}

protocol NetworkProtocol {
    
    var baseUrl:String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var parameters: [String: Any] { get }
}


extension NetworkProtocol {
    
    var headers: [String:String] {
        return ["x-rapidapi-host":HeaderConfig.rapidapHost.rawValue,
                "x-rapidapi-key":HeaderConfig.rapidapKey.rawValue]
    }
    
    var requestData: Data {
        do {
            switch self.task {
            case .requestPlain:
                return try JSONSerialization.data(withJSONObject: [:], options: .prettyPrinted)
            case .requestParameter(let param):
                return try JSONSerialization.data(withJSONObject: param, options: .prettyPrinted)
            }
        } catch {
            return Data()
        }
    }
    private func requestBodyFrom(params: [String: Any]?) -> Data? {
        guard let params = params else { return nil }
        guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {
            return nil
        }
        return httpBody
        
    }
    
    var baseUrlRequest: URLRequest {
        
        guard let url = URL(string: baseUrl + path) else { preconditionFailure("Invalid URL used to create URL instance") }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
//        request.httpBody = requestBodyFrom(params: self.parameters)
        return request
    }
}
