//
//  FetchMarketPriceUseCase.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation
import RxSwift

protocol FetchMarketPriceUseCase {
    func fetchMarketPriceUseCase() -> Single<MarketPriceResponse>
}

final class FFetchMarketPriceUseCaseImpl {
    
    func fetchMarketPriceUseCase() -> Single<MarketPriceResponse> {
        if let stats = BitcoinApi.stats() {
            return Single.just(stats)
        }
        return Single.just(MarketPriceResponse(marketPrice: 0))
    }
    
}
