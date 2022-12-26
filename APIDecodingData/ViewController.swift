//
//  ViewController.swift
//  APIDecodingData
//
//  Created by Pedro Erazo Acosta on 26/12/22.
//

import UIKit

class ViewController: UIViewController {

    private let responseService = ResponseService(
        urlString: Constants.baseUrl,
        apiKey: Bundle.main.infoDictionary?["API_KEY"] as? String
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func printDataWithoutCodingKeys(_ sender: UIButton) {
        responseService.responseWithClousure { response in
            if let weather  = response.weather.first {
                print(weather.description)
            }
        }
    }

    @IBAction func printDataWithCodingKeys(_ sender: UIButton) {
        Task {
            do {
                if let response = try await responseService.responseWithAsync() {
                    print(response.coordinates.latitude)
                    print(response.coordinates.longitude)
                }
            } catch {
                print(error)
            }
        }
    }

}

