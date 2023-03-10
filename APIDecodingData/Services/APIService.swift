//
//  APIService.swift
//  APIDecodingData
//
//  Created by Pedro Erazo Acosta on 26/12/22.
//

import Foundation

struct ResponseService {

    private enum ResponseConstants {
        static let latitude = 44.34
        static let longitude = 10.99
        static let weatherResponse = "weather?lat=%.2f&lon=%.2f"
    }

    private let urlString: String
    private let apiKey: String?
    private var url: URL? {
        guard let apiKey = apiKey else { return nil }
        let weatherResponse = String(format: ResponseConstants.weatherResponse, ResponseConstants.latitude, ResponseConstants.longitude)
        let fullUrlString = urlString + weatherResponse + "&appid=" + apiKey
        return URL(string: fullUrlString)
    }

    init(urlString: String, apiKey: String?) {
        self.urlString = urlString
        self.apiKey = apiKey
    }

    func responseWithClousure(completion: @escaping (Response) -> ()) {
        if let url = url {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(Response.self, from: data)
                        completion(decodedData)
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }

    func responseWithAsync() async throws -> Response? {
        if let url = url {
            let session = URLSession.shared
            let (data, _) = try await session.data(from: url)
            return try JSONDecoder().decode(Response.self, from: data)
        }
        return nil
    }

}
