//
//  User.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 16/09/2021.
//

import Foundation

public struct User: Codable {

    public let userId: Int
    public let id: Int
    public let title: String
    public let body: String


    public init(userId: Int,
                id: Int,
                title: String,
                body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }

    private enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        userId = try container.decode(Int.self, forKey: .userId)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        body = try container.decode(String.self, forKey: .body)
    }
}
//
//extension User: Equatable {
//    public static func == (lhs: User, rhs: User) -> Bool {
//        return lhs.uid == rhs.uid &&
//            lhs.email == rhs.email &&
//            lhs.name == rhs.name &&
//            lhs.phone == rhs.phone &&
//            lhs.username == rhs.username &&
//            lhs.website == rhs.website
//    }
//}
