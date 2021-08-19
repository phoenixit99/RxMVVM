//
//  BaseApiClient.swift
//  RxMVVM
//
//  Created by NguyenHoang on 8/13/21.
//

import Foundation

enum ApiUrl {
    static let baseUrl = "https://jsonplaceholder.typicode.com"
}

enum Result<T> {
    
    case success(T)
    case failure(Error)
}
//protocol URLSessionProtocol {
//    func requestUrl<T:Decodable>(completion: @escaping (Result<T>) -> Void)
//}
//extension URLRequest: URLSessionProtocol {
//    func requestUrl<T:Decodable>(completion: @escaping (Result<T>) -> Void) {
//
//    }
//}
class BaseApiClient : ServicesProtocol  {
    
    
    var baseUrl: String = ApiUrl.baseUrl
    
    var path: String = ""
    
    var method: HTTPMethod = .get
    
    var headers: [String : Any] = [:]
    
    var task: Task = .requestPlain
    
    var parameterEncoding: ParametersEncoding = .plain
    
    private func requestData() -> [String:Any] {
        
        switch self.task {
        case .requestPlain:
            return [:]
        case .requestParameter(let param):
            return param
        }
    }
    var request:URLRequest?
    
    init() {

        guard var url = URL(string: baseUrl) else { return }
        url.appendPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let requestData = self.requestData()
        guard let paramRequest = try? JSONSerialization.data(withJSONObject: requestData, options: .prettyPrinted) else { return }
        request.httpBody = paramRequest
        self.request = request

    }
    
    func requestUrl<T:Decodable>(endPoint: String,completion: @escaping (Result<T>) -> Void) {
        //create the url with NSURL
        guard let urlRequest = self.request else {
            return
        }
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let data = data else {
                return
            }
            do {
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedObject))
            } catch let error {
                completion(.failure(error))
            }
        })
        task.resume()
    }
}
