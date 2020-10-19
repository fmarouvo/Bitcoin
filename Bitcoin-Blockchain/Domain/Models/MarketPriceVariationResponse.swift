//
//  MarketPriceVariationResponse.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation

struct MarketPriceVariationResponse: Codable {
    let marketPriceValues: [MarketPriceValues]
    
    enum CodingKeys: String, CodingKey {
        case marketPriceValues = "values"
    }
}

struct MarketPriceValues: Codable {
    let date: Date
    let value: Double
    
    enum CodingKeys: String, CodingKey {
        case date = "x"
        case value = "y"
    }
}
