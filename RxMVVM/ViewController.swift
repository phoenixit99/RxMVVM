//
//  ViewController.swift
//  RxMVVM
//
//  Created by NguyenHoang on 8/13/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func callLogiinAction(_ sender: Any) {
        let loginServices = LoginServices(authenType: .login)
        loginServices.doLogin("", password: "") {[weak self] resData in
            switch resData {
            case .success(let user):
                print(user.title)
                break
            case .failure(let error):
                break
            }
        }
    }
    
}

