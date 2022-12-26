//
//  Response.swift
//  APIDecodingData
//
//  Created by Pedro Erazo Acosta on 26/12/22.
//

struct Response: Decodable {
    let weather: [Weather]
    let coordinates: Coordinates

    private enum CodingKeys: String, CodingKey {
        case coordinates = "coord"
        case weather
    }
}
