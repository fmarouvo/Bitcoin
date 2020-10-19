//
//  HomeInteractor.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation
import RxSwift

protocol HomeInteractable: AnyObject, FetchMarketPriceUseCase, FetchMarketPriceVariationUseCase {}

final class HomeInteractor {
    private let marketPriceUseCase: FetchMarketPriceUseCase
    private let marketPriceVariationUseCase: FetchMarketPriceVariationUseCase
    
    init(marketPriceUseCase: FetchMarketPriceUseCase, marketPriceVariationUseCase: FetchMarketPriceVariationUseCase) {
        self.marketPriceUseCase = marketPriceUseCase
        self.marketPriceVariationUseCase = marketPriceVariationUseCase
    }
    
    func fetchMarketPrice() -> Single<MarketPriceResponse> {
        marketPriceUseCase.fetchMarketPriceUseCase()
    }
    
    func fetchMarketPriceVariationUseCase() -> Single<MarketPriceVariationResponse> {
        marketPriceVariationUseCase.fetchMarketPriceVariationUseCase()
    }
}
