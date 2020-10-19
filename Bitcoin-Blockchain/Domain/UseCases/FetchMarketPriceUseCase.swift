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

final class FetchMarketPriceUseCaseImpl: FetchMarketPriceUseCase {
    
    let apiClient = ApiClient()
    
    func fetchMarketPriceUseCase() -> Single<MarketPriceResponse> {
        apiClient.requestSingle(BitcoinRouter.fetchStats, type: MarketPriceResponse.self)
    }
}
