//
//  FetchMarketPriceVariationUseCase.swift.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation
import RxSwift

protocol FetchMarketPriceVariationUseCase {
    func fetchMarketPriceUseCase() -> Single<MarketPriceVariationResponse>
}

final class FetchMarketPriceVariationUseCaseImpl {
    
    func fetchMarketPriceVariationUseCase() -> Single<MarketPriceVariationResponse> {
        if let marketPrice = BitcoinApi.marketPrice() {
            return Single.just(marketPrice)
        }
        return Single.just(MarketPriceVariationResponse(marketPriceValues: []))
    }
    
}
