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
  
        NetworkService.getForecaseWeather("vietnam", day: 3) { [weak self] result  in
            
        }
    }
    
}

