//
//  ViewController.swift
//  APIDecodingData
//
//  Created by Pedro Erazo Acosta on 26/12/22.
//

import UIKit

class ViewController: UIViewController {

    private let responseService = ResponseService(urlString: Constants.baseUrl, apiKey: Constants.apiKey)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func printDataWithoutCodingKeys(_ sender: UIButton) {
        responseService.response { response in
            if let weather  = response.weather.first {
                print(weather.description)
            }
        }
    }

    @IBAction func printDataWithCodingKeys(_ sender: UIButton) {
        responseService.response { response in
            print(response.coordinates.latitude)
            print(response.coordinates.longitude)
        }
    }

}

