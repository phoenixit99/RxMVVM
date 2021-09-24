//
//  BaseApiClient.swift
//  RxMVVM
//
//  Created by NguyenHoang on 8/13/21.
//

import Foundation

protocol NetworkProvider {
    static func requestUrl<T:Decodable>(networkRequest: URLRequest,completion: @escaping (Result<T,Error>) -> Void)
}

extension NetworkProvider {
    
    static public func requestUrl<T:Decodable>(networkRequest: URLRequest,completion: @escaping (Result<T,Error>) -> Void) {
        
        let task = URLSession.shared.dataTask(with: networkRequest, completionHandler: { data, response, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "")
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

