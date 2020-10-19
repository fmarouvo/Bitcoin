//
//  MarketPriceResponse.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation

struct MarketPriceResponse: Codable {
    let marketPrice: Double
    
    enum CodingKeys: String, CodingKey {
        case marketPrice = "market_price_usd"
    }
}
