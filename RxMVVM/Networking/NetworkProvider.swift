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

protocol NetworkProvider {
    
    var urlRequest: URLRequest { get }
    func requestUrl<T:Decodable>(urlRequest: URLRequest,completion: @escaping (Result<T,Error>) -> Void)
    
}

extension NetworkProvider {

    public func requestUrl<T:Decodable>(urlRequest: URLRequest,completion: @escaping (Result<T,Error>) -> Void) {

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

