//
//  LocationModel.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 18/09/2021.
//

import UIKit

public struct LocationModel: Codable {
    
    public let name: String?
    public let region: String?
    public let country: String?
    public let lat: Double?
    public let lon: Double?
    public let tz_id: String?
    public let localtime: String?
    public let localtime_epoch: Int?
    public let url: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case lat
        case lon
        case tz_id
        case localtime
        case localtime_epoch
        case url
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        region = try? container.decodeIfPresent(String.self, forKey: .region)
        country = try? container.decodeIfPresent(String.self, forKey: .country)
        lat = try? container.decodeIfPresent(Double.self, forKey: .lat)
        lon = try? container.decodeIfPresent(Double.self, forKey: .lon)
        tz_id = try? container.decodeIfPresent(String.self, forKey: .tz_id)
        localtime = try? container.decodeIfPresent(String.self, forKey: .localtime)
        localtime_epoch = try? container.decodeIfPresent(Int.self, forKey: .localtime_epoch)
        url = try? container.decodeIfPresent(String.self, forKey: .url)

    }
}
