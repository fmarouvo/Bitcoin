//
//  HomeViewModel.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import Foundation
import RxSwift

protocol HomeViewModelInput: AnyObject {
    var fetchMarketPrice: PublishSubject<Void> { get }
    var fetchMarketPriceVariation: PublishSubject<Void> { get }
}

protocol HomeViewModelOutput: AnyObject {
    var onMarketPriceFetched: Driver<Void>
    var onMarketPriceVariationFetched: Driver<Void>
}

protocol HomeViewModelType: AnyObject {
    var input: HomeViewModelInput { get }
    var output: HomeViewModelOutput { get }
}

class HomeViewModel: HomeViewModelType, HomeViewModelInput, HomeViewModelOutput {
    
    init(interactor: HomeInteractable) {
        
    }
    
    let fetchMarketPrice: PublishSubject<Void> = PublishSubject()
    let fetchMarketPriceVariation: PublishSubject<Void> = PublishSubject()
    
    var input: HomeViewModelInput { return self }
    var output: HomeViewModelOutput { return self }
    
}
