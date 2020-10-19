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
    var onMarketPriceFetched: Driver<String> { get }
    var onMarketPriceVariationFetched: Driver<[MarketPriceValues]> { get }
}

protocol HomeViewModelType: AnyObject {
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
}

class HomeViewModel: HomeViewModelType, HomeViewModelInput, HomeViewModelOutput {
    
    let onMarketPriceFetched: Driver<String>
    let onMarketPriceVariationFetched: Driver<[MarketPriceValues]>
    
    init(interactor: HomeInteractable) {
        
        onMarketPriceFetched = fetchMarketPrice.asDriver(onErrorJustReturn: Void())
            .flatMap { _ in
                interactor.fetchMarketPriceUseCase()
                    .map { $0.marketPrice.convertToMoneyWithTwoDecimals() }
                    .asDriver(onErrorJustReturn: "R$ 0,00")
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
