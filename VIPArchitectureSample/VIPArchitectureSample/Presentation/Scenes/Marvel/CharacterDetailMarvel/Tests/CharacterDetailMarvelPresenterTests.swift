//
//  CharacterDetailMarvelPresenterTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample


final class CharacterDetailMarvelPresenterTests: XCTestCase {

    private var presenter: CharacterDetailMarvelPresenter!
    private var viewController: CharacterDetailMarvelViewControllerMock!

    override func setUp() {
        viewController = CharacterDetailMarvelViewControllerMock()
        presenter = CharacterDetailMarvelPresenter(viewController: viewController)
    }

    override func tearDown() {
        viewController = nil
        presenter = nil
    }
}


// MARK: - Tests
extension CharacterDetailMarvelPresenterTests {

    func testShowError() {
        XCTAssertNil(viewController.passedCharacter)
        let testErrorModel = ErrorHelper.createGenericError()
        presenter.presentResponse(.showError(model: testErrorModel))
        XCTAssertEqual(viewController.passedErrorModel.message, testErrorModel.message)
    }

    func testCharacter() {
        XCTAssertNil(viewController.passedCharacter)
        let dummyData = CharacterDetailMarvelEntity.dummyInstance()
        presenter.presentResponse(.prepareCharactersDetail(data: dummyData))
        XCTAssertEqual(viewController.passedCharacter.title, dummyData.name)
    }
}
