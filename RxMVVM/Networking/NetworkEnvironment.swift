//
//  NetworkEnvironment.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 24/09/2021.
//

import Foundation

enum Environment {
    case production
    case statging
    case qa
}
enum ApiUrl {
    
    static var baseUrl:String {
        switch NetworkService.environment {
        case .production:
            return "https://weatherapi-com.p.rapidapi.com"
        case .statging:
            return "https://weatherapi-com.p.rapidapi.com"
        case .qa:
            return "https://weatherapi-com.p.rapidapi.com"
        }
    }
}
