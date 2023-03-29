//
//  NetworkEnvironment.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 24/09/2021.
//

import Foundation

enum Environment {
    case production
    case staging
    case qa
}
enum ApiUrl {
    
    static var baseUrl:String {
        switch NetworkService.environment {
        case .production:
            return "http://api.weatherapi.com/v1"
        case .staging:
            return "http://api.weatherapi.com/v1"
        case .qa:
            return "http://api.weatherapi.com/v1"
        }
    }
}
