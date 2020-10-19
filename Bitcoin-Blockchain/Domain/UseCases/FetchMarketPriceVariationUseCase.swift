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
    
    func fetchMarketPriceVariationUseCase() -> Single<MarketPriceVariationResponse> {
        BitcoinApi().marketPrice().map { result in
            return Single.just(result)
        }
         
        
    }
    
}
