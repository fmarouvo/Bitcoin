//
//  HomeViewModel.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol HomeViewModelInput: AnyObject {
    var fetchMarketPrice: PublishSubject<Void> { get }
    var fetchMarketPriceVariation: PublishSubject<Void> { get }
}

protocol HomeViewModelOutput: AnyObject {
    var onMarketPriceFetched: Driver<MarketPriceResponseDisplayable> { get }
    var onMarketPriceVariationFetched: Driver<[MarketPriceValues]> { get }
}

protocol HomeViewModelType: AnyObject {
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
}

class HomeViewModel: HomeViewModelType, HomeViewModelInput, HomeViewModelOutput {
    
    let onMarketPriceFetched: Driver<MarketPriceResponseDisplayable>
    let onMarketPriceVariationFetched: Driver<[MarketPriceValues]>
    
    init(interactor: HomeInteractable) {
        
        onMarketPriceFetched = fetchMarketPrice.asDriver(onErrorJustReturn: Void())
            .flatMap { _ in
                interactor.fetchMarketPriceUseCase()
                    .map { marketPriceResponse in
                        return MarketPriceResponseDisplayable(
                            marketPrice: marketPriceResponse.marketPrice.convertToMoneyWithTwoDecimals(),
                            updatedAt: marketPriceResponse.updatedAt.dateFromTimestamp().formatted(using: .dateAndTime))
                    }
                    .asDriver(onErrorJustReturn: MarketPriceResponseDisplayable(
                                marketPrice: "0",
                                updatedAt: Date().formatted(using: .dateAndTime)
                    ))
            }
        
        onMarketPriceVariationFetched = fetchMarketPriceVariation.asDriver(onErrorJustReturn: Void())
            .flatMap { _ in
                interactor.fetchMarketPriceVariationUseCase()
                    .map { $0.marketPriceValues }
                    .asDriver(onErrorJustReturn: [])
            }
        
    }
    
    let fetchMarketPrice: PublishSubject<Void> = PublishSubject()
    let fetchMarketPriceVariation: PublishSubject<Void> = PublishSubject()
    
    var input: HomeViewModelInput { return self }
    var output: HomeViewModelOutput { return self }
    
}

class MarketPriceResponseDisplayable {
    let marketPrice: String
    let updatedAt: String
    
    init(marketPrice: String, updatedAt: String) {
        self.marketPrice = marketPrice
        self.updatedAt = updatedAt
    }
}
