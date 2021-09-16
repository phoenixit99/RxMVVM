//
//  LoginUserCase.swift
//  RxMVVM
//
//  Created by Nguyen Hoang on 16/09/2021.
//

import Foundation

protocol LoginUserCase {
    func doLogin(_ userName: String, password: String,callback: @escaping (Result<User,Error>) -> Void)
}
