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

class BaseApiClient  {

    func requestUrl<T:Decodable>(endPoint: String,completion: @escaping (Result<T>) -> Void) {
        //create the url with NSURL
        let urlRequest = ApiUrl.baseUrl + endPoint
        guard let url = URL(string: urlRequest) else { return }
        let session = URLSession.shared
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
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
