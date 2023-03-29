//
//  ViewController.swift
//  RxMVVM
//
//  Created by NguyenHoang on 8/13/21.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func callLogiinAction(_ sender: Any) {
        
        NetworkService.getForecastWeather("vietnam", day: 3) { [weak self] result  in
            guard let self = self else { return }
            switch result {
            case .success(let forecast):
                print(" location === \(forecast.location?.convertToString)")
            case .failure(let error):
                break
            }
        }
    }
    
    @IBAction func callSearchAutoComplete(_ sender: Any) {
        
        NetworkService.searchWeatherByCity("london") { [weak self] result  in
            guard let self = self else { return }
            switch result {
            case .success(let forecast):
                print(" location === \(forecast.first?.convertToString)")
            case .failure(let error):
                break
            }
        }
    }
    
}

