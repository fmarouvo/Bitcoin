//
//  LocalRepository.swift
//  Bitcoin-Blockchain
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation

final class LocalRepository {
    
    enum Keys: String {
        case marketPrice
        case marketPriceVariation
    }
    
    static func saveMarketPrice(data: MarketPriceResponse) {
        UserDefaults.standard.set(data, forKey: Keys.marketPrice.rawValue)
    }
    
    static func saveMarketPriceVariation(data: MarketPriceVariationResponse) {
        UserDefaults.standard.set(data, forKey: Keys.marketPriceVariation.rawValue)
    }
    
    static func fetchMarketPrice() -> MarketPriceResponse? {
        UserDefaults.standard.object(forKey: Keys.marketPrice.rawValue) as? MarketPriceResponse
    }
    
    static func fetchMarketPriceVariation() -> MarketPriceVariationResponse? {
        UserDefaults.standard.object(forKey: Keys.marketPriceVariation.rawValue) as? MarketPriceVariationResponse
    }
    
}
