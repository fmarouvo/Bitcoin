//
//  HomeViewController.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/18/20.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {

    private let viewModel: HomeViewModelType
    private let disposeBag = DisposeBag()
    
    init(viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareViewModel()
        fetchData()
    }

    func prepareViewModel() {
        viewModel.output.onMarketPriceFetched
            .drive(onNext: { [weak self] price in
                guard let self = self else { return }
                print(price)
            }).disposed(by: disposeBag)
        
        viewModel.output.onMarketPriceVariationFetched
            .drive(onNext: { [weak self] variation in
                guard let self = self else { return }
                print(variation)
            }).disposed(by: disposeBag)
    }
    
    func fetchData() {
        viewModel.input.fetchMarketPrice.onNext(())
        viewModel.input.fetchMarketPriceVariation.onNext(())
    }

}
