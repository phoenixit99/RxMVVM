//
//  LoginUserCase.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 16/09/2021.
//

import Foundation

protocol ForecaseProtocol {
    static func getForecaseWeather(_ search: String,day: Int,completion: @escaping (Result<ForecaseWeather,Error>)->Void )
}
