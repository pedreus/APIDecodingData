//
//  Weather.swift
//  APIDecodingData
//
//  Created by Pedro Erazo Acosta on 26/12/22.
//

struct Weather: Decodable {
    let id: Int
    let main: String
    let description: String
}
