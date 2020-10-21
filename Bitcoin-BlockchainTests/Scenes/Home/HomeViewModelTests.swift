//
//  HomeViewModelTests.swift
//  Bitcoin-Blockchain
//
//  Created by Fausto Castagnari Marouvo on 10/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import Bitcoin-Blockchain
import RxCocoa
import RxSwift
import RxTest
import XCTest

final class HomeViewModelTests: XCTestCase {
    private var sut: HomeViewModel!
    private var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()
        setupHomeViewModel()
    }

    override func tearDown() {
        super.tearDown()
    }

    private func setupHomeViewModel() {
        disposeBag = DisposeBag()
    }

    func testExample() {}
}
