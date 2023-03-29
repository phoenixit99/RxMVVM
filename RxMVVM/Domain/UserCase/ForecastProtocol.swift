//
//  LoginUserCase.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 16/09/2021.
//

import Foundation

protocol ForecastProtocol {
    
    static func getForecastWeather(_ search: String,day: Int,completion: @escaping (Result<ForecastWeather,Error>)->Void )
    
    static func searchWeatherByCity(_ cityName: String,completion: @escaping (Result<[LocationModel],Error>)->Void )
    
}
