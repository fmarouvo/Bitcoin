//
//  BitcoinApi.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation
import UIKit
import Alamofire

class BitcoinApi {
    
    static let baseUrl = "https://api.blockchain.info/"
    
    static func stats() -> MarketPriceResponse? {
        AF.request(baseUrl + "stats", method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? MarketPriceResponse {
                    LocalRepository.saveMarketPrice(data: json)
                }
            case .failure(let error):
                print("Alamofire Debug Error: " + (error.errorDescription ?? "error"))
                break
            }
        }.data.map { data in
            print(data)
        }
        return nil
    }
    
    static func marketPrice() -> MarketPriceVariationResponse? {
        AF.request(baseUrl + "charts/market-price?timespan=1months", method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? MarketPriceVariationResponse {
                    LocalRepository.saveMarketPriceVariation(data: json)
                }
            case .failure(let error):
                print("Alamofire Debug Error: " + (error.errorDescription ?? "error"))
                break
            }
        }
        return nil
    }

    
}
