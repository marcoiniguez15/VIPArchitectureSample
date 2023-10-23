//
//  CharactersListMarvelPresenterTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample


final class CharactersListMarvelPresenterTests: XCTestCase {

    private var presenter: CharactersListMarvelPresenter!
    private var viewController: CharactersListMarvelViewControllerMock!

    override func setUp() {
        viewController = CharactersListMarvelViewControllerMock()
        presenter = CharactersListMarvelPresenter(viewController: viewController)
    }

    override func tearDown() {
        viewController = nil
        presenter = nil
    }
}


// MARK: - Tests
extension CharactersListMarvelPresenterTests {

    func testShowDetail() {
        XCTAssertNil(viewController.passedId)
        let testId = 1011334
        presenter.presentResponse(.showDetail(id: testId))
        XCTAssertEqual(viewController.passedId, testId)
    }
    func testShowError() {
        XCTAssertNil(viewController.passedId)
        let testErrorModel = ErrorHelper.createGenericError()
        presenter.presentResponse(.showError(model: testErrorModel))
        XCTAssertEqual(viewController.passedErrorModel.message, testErrorModel.message)
    }

    func testCharactersList() {
        XCTAssertNil(viewController.passedList)
        let dummyData = CharactersListMarvelItemEntity.dummyInstance()
        presenter.presentResponse(.prepareCharactersListMarvel(data: dummyData))
        XCTAssertEqual(viewController.passedList.items.count, dummyData.count)
    }
}
