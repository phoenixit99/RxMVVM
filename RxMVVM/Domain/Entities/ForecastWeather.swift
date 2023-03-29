//
//  ForecastWeather.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 18/09/2021.
//

import UIKit

public struct ForecastWeather: Codable {

    public let location:LocationModel?
    public let currentWeather:WeatherModel?
    
    private enum CodingKeys: String, CodingKey {
        case location
        case currentWeather = "current"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        location = try container.decodeIfPresent(LocationModel.self, forKey: .location)
        currentWeather = try container.decodeIfPresent(WeatherModel.self, forKey: .currentWeather)
    }
    
}
