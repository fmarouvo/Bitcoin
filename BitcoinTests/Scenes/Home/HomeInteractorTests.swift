//
//  HomeInteractorTests.swift
//  Bitcoin
//
//  Created by Fausto Castagnari Marouvo on 10/20/20.

@testable import Bitcoin
import RxCocoa
import RxSwift
import RxTest
import XCTest

final class HomeInteractorTests: XCTestCase {
    private var sut: HomeInteractor!
    private var disposeBag: DisposeBag!

    override func setUp() {
        super.setUp()
        setupHomeInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    private func setupHomeInteractor() {
        disposeBag = DisposeBag()
    }

    func testExample() {}
}
