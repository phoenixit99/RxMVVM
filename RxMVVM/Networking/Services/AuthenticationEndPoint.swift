//
//  AuthenticationEndPoint.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 17/09/2021.
//

import UIKit

enum ForecastRequest {
   
    case searchByCity(search: String)
    case forecastWeather(search: String, day: Int)
    case logout
}

extension ForecastRequest: NetworkProtocol {

    var baseUrl: String {
        return ApiUrl.baseUrl
    }
    var path: String {
        switch self {
        case .forecastWeather(let search,let day):
            return "/forecast.json?q=\(search)&day=\(day)"
        case .searchByCity(let search):
            return "/search.json?q=\(search)"
        default:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .forecastWeather:
            return .get
        default:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .forecastWeather:
            return .requestPlain
        default:
            return .requestPlain
        }
    }
    
    var parameters: [String : Any] {
    
        switch self {
        case .forecastWeather:
            return [:]
        case .searchByCity:
            return [:]
        default:
            return [:]
        }
        
    }
}
