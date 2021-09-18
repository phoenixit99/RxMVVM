//
//  ConditionModel.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 18/09/2021.
//

import UIKit

public struct ConditionModel: Codable {
    public let text: String?
    public let icon:String?
    public let code: Int?
    
    private enum CodingKeys: String, CodingKey {
        case text
        case icon
        case code
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        text = try container.decodeIfPresent(String.self, forKey: .text)
        icon = try container.decodeIfPresent(String.self, forKey: .icon)
        code = try container.decodeIfPresent(Int.self, forKey: .code)
    }
}
