//
//  WeatherModel.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 18/09/2021.
//

import UIKit

public struct WeatherModel : Codable {

    public let lastEpoch: Int?
    public let tempC: Float?
    public let tempF: Float?
    public let windMph: Float?
    public let windKph:Float?
    public let windDegree:Float?
    public let windDir:String?
    public let pressureMb:Int?
    public let humidity: Int?
    public let cloud:Int?
    public let feelslikeC:Float?
    public let feelslikeF:Float?
    public let condition:ConditionModel?
    
    private enum CodingKeys: String, CodingKey {
        case lastEpoch = "last_updated_epoch"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case condition = "condition"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        lastEpoch = try container.decodeIfPresent(Int.self, forKey: .lastEpoch)
        tempC = try container.decodeIfPresent(Float.self, forKey: .tempC)
        tempF = try container.decodeIfPresent(Float.self, forKey: .tempF)
        windMph = try container.decodeIfPresent(Float.self, forKey: .windMph)
        windKph = try container.decodeIfPresent(Float.self, forKey: .windKph)
        windDegree = try container.decodeIfPresent(Float.self, forKey: .windDegree)
        windDir = try container.decodeIfPresent(String.self, forKey: .windDir)
        pressureMb = try container.decodeIfPresent(Int.self, forKey: .pressureMb)
        humidity = try container.decodeIfPresent(Int.self, forKey: .humidity)
        cloud = try container.decodeIfPresent(Int.self, forKey: .cloud)
        feelslikeC = try container.decodeIfPresent(Float.self, forKey: .feelslikeC)
        feelslikeF = try container.decodeIfPresent(Float.self, forKey: .feelslikeF)
        condition = try container.decodeIfPresent(ConditionModel.self, forKey: .condition)
    }
}
