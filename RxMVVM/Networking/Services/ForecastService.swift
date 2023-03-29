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

extension NetworkService : ForecastProtocol {
    
    static func searchWeatherByCity(_ cityName: String, completion: @escaping (Result<[LocationModel], Error>) -> Void) {
        
        let forestRequest =  ForecastRequest.searchByCity(search: cityName)
        requestUrl(networkRequest: forestRequest.urlRequest, completion: completion)
    }
    
    static func getForecastWeather(_ search: String,
                                   day: Int,
                                   completion: @escaping (Result<ForecastWeather,Error>)->Void ) {
        
        let forecastRequest =  ForecastRequest.forecastWeather(search: search, day: day)
        requestUrl(networkRequest: forecastRequest.urlRequest, completion: completion)
    }
}
