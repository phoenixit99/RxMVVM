//
//  ListUser.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 16/09/2021.
//

import UIKit

class ListUser: Codable {
    
    public let userItem: [User]

    public init(userItem: [User]) {
        self.userItem = userItem
    }

    private enum CodingKeys: String, CodingKey {
        case userItem
    }

    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userItem = try container.decode([User].self, forKey: .userItem)
    }
}
