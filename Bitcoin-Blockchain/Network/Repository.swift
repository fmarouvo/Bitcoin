//
//  Repository.swift
//  Bitcoin-Blockchain
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation

final class Repository {
    
    enum Keys: String {
        case marketPrice
        case marketPriceVariation
    }
    
    private let userDefaults = UserDefaults.standard
    
    func save<T>(data: T, key: Repository.Keys) {
        userDefaults.set(data, forKey: key.rawValue)
    }
    
    func fetchMarketPrice(from: Repository.Keys) -> MarketPriceResponse? {
        userDefaults.object(forKey: from.rawValue) as? MarketPriceResponse
    }
    
    func fetchMarketPriceVariation(from: Repository.Keys) -> MarketPriceVariationResponse? {
        userDefaults.object(forKey: from.rawValue) as? MarketPriceVariationResponse
    }
    
}
