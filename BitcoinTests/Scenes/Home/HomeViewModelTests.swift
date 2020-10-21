//
//  HomeViewModelTests.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/20/20.


@testable import Bitcoin
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
