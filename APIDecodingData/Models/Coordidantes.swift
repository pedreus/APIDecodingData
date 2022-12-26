//
//  Coordidantes.swift
//  APIDecodingData
//
//  Created by Pedro Erazo Acosta on 26/12/22.
//

import Foundation

struct Coordinates: Decodable {

    let longitude: Double
    let latitude: Double
    
    private enum CodingKeys: String, CodingKey {
        case longitude = "lon"
        case latitude = "lat"
    }
}
