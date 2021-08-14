//
//  BaseRepository.swift
//  RxMVVM
//
//  Created by NguyenHoang on 8/13/21.
//

import Foundation

struct BaseRepository<T> {
    
    let status:Int?
    let msg:String?
}

extension BaseRepository: Decodable {
    
    enum CodingKeys: String,CodingKey {
        case status
        case msg
    }
    
}
