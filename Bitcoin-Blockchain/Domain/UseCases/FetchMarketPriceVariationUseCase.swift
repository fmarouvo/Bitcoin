//
//  FetchMarketPriceVariationUseCase.swift.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation
import RxSwift

protocol FetchMarketPriceVariationUseCase {
    func fetchMarketPriceVariationUseCase() -> Single<MarketPriceVariationResponse>
}

final class FetchMarketPriceVariationUseCaseImpl: FetchMarketPriceVariationUseCase {
    
    let apiClient = ApiClient()
    
    func fetchMarketPriceVariationUseCase() -> Single<MarketPriceVariationResponse> {
        apiClient.requestSingle(BitcoinRouter.fetchMarketPrice, type: MarketPriceVariationResponse.self)
    }
    
}
