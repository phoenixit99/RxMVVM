//
//  ParserData+Extensions.swift
//  RxMVVM
//
//  Created by Hoang Nguyen on 9/10/22.
//

import Foundation

extension Encodable {
    var convertToString: String? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do {
            let jsonData = try jsonEncoder.encode(self)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            return nil
        }
    }
}
