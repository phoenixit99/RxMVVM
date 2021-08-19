//
//  ServicesProtocol.swift
//  RxMVVM
//
//  Created by NguyenHoang on 8/14/21.
//

import UIKit

enum ParametersEncoding {
    case json
    case plain
}

typealias Parameters = [String: Any]

enum Task {
    case requestParameter(Parameters)
    case requestPlain
}

protocol ServicesProtocol {

    var baseUrl:String { get }
    var path: String {get}
    var method: HTTPMethod { get }
    var headers: [String:Any] { get }
    var task: Task { get }
    var parameterEncoding: ParametersEncoding { get }
}
