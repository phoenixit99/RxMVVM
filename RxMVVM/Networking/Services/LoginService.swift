//
//  LoginService.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 16/09/2021.
//

import Foundation

enum AuthenticationService {
    case login
    case logout
}

extension AuthenticationService: NetworkProtocol {
    
    var baseUrl: String {
        return ApiUrl.baseUrl
    }
    var path: String {
        switch self {
        case .login:
            return "/posts/1"
        default:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .get
        default:
            return .get
        }
    }
    
    var headers: [String : Any] {
        switch self {
        case .login:
            return [:]
        default:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        case .login:
            return .requestPlain
        default:
            return .requestPlain
        }
    }
    
    var parameterEncoding: ParametersEncoding {
        switch self {
        case .login:
            return .plain
        default:
            return .plain
        }
    }
    
    public func requestData() -> [String:Any] {
        switch self.task {
        case .requestPlain:
            return [:]
        case .requestParameter(let param):
            return param
        }
    }
    
    var urlRequest: URLRequest {
        guard var url = URL(string: baseUrl) else {
            preconditionFailure("Invalid URL used to create URL instance") }
        url.appendPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let requestData = self.requestData()
        guard let paramRequest = try? JSONSerialization.data(withJSONObject: requestData, options: .prettyPrinted) else {         preconditionFailure("Invalid URL used to create URL instance") }
        request.httpBody = paramRequest
        return request
    }
}

public class LoginServices: LoginUserCase, NetworkProvider {
    
    public var urlRequest: URLRequest
    init(authenType: AuthenticationService) {
        urlRequest = authenType.urlRequest
    }
    
    func doLogin(_ userName: String, password: String, callback: @escaping (Result<User,Error>) -> Void) {
        requestUrl(urlRequest: urlRequest, completion: callback)
    }
    
}
