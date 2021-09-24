//
//  LoginService.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 16/09/2021.
//

import Foundation

enum NetworkService: NetworkProvider {
    static var environment: Environment = .production
}

extension NetworkService : ForecaseProtocol {
    
    static func getForecaseWeather(_ search: String,
                                   day: Int,
                                   completion: @escaping (Result<ForecaseWeather,Error>)->Void ) {
        
        let forestRequest =  ForecastRequest.forecastWeather(search: search, day: day)
        requestUrl(networkRequest: forestRequest.urlRequest, completion: completion)
    }
}
