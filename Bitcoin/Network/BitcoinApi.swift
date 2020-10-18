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
    
    static let baseUrl = "https://api.blockchain.com/v3/"
    
    static func stats() -> MarketPriceResponse? {
        var result: MarketPriceResponse? = nil
        AF.request(baseUrl + "stats", method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? MarketPriceResponse {
                    result = json
                }
            case .failure(let error):
                print("Alamofire Debug Error: " + (error.errorDescription ?? "error"))
                break
            }
        }
        return result
    }
    
    static func marketPrice() -> MarketPriceVariationResponse? {
        var result: MarketPriceVariationResponse? = nil
        AF.request(baseUrl + "stats", method: .get).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? MarketPriceVariationResponse {
                    result = json
                }
            case .failure(let error):
                print("Alamofire Debug Error: " + (error.errorDescription ?? "error"))
                break
            }
        }
        return result
    }

    
}
