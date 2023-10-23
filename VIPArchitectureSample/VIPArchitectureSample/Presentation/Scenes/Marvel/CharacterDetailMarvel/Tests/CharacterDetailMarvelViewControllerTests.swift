//
//  CharacterDetailMarvelViewControllerTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharacterDetailMarvelViewControllerTests: XCTestCase {

    private var interactor: CharacterDetailMarvelInteractorMock!
    private var viewController: CharacterDetailMarvelViewController!
    private var router: CharacterDetailMarvelRouterMock!
    private var mainView = CharacterDetailMarvelViewMock()

    override func setUp() {
        viewController = CharacterDetailMarvelViewController(factory: self,
                                                             mainView: mainView,
                                                             dataSource: CharacterDetailMarvelModel.DataSource(characterId: 1))
    }

    override func tearDown() {
        interactor = nil
        viewController = nil
        router = nil
    }
}



// MARK: - Tests
extension CharacterDetailMarvelViewControllerTests {
    func testShowError() {
        router.errorExpectation = expectation(description: "errorExpectation")
        let testErrorModel = ErrorHelper.createGenericError()
        viewController.displayViewModel(.showError(model: testErrorModel))
        wait(for: [router.errorExpectation], timeout: 0.1)
        XCTAssertEqual(testErrorModel.message, router.passedErrorModel.message)

    }

    func testPrepareCharacterDetail() {
        mainView.showDetailExpectation = expectation(description: "showDetailExpectation")
        let testViewData = CharacterDetailMarvelModel.ViewDataSource(title: "Title", imageName: nil, sections: [])
        viewController.displayViewModel(.prepareCharactersDetail(viewModelData: testViewData))
        wait(for: [mainView.showDetailExpectation], timeout: 0.1)
        XCTAssertTrue(mainView.updateDataSourceCalled)
    }
}


// MARK: - Factorable, Injector
extension CharacterDetailMarvelViewControllerTests: CharacterDetailMarvelFactorable {

    func makeInteractor(factory: InteractableFactory,
                        viewController: CharacterDetailMarvelDisplayLogic?,
                        dataSource: CharacterDetailMarvelModel.DataSource) -> CharacterDetailMarvelInteractable {
        interactor = CharacterDetailMarvelInteractorMock(dataSource: dataSource)
        return interactor
    }

    func makeRouter(viewController: UIViewController?) -> CharacterDetailMarvelRouting {
        router = CharacterDetailMarvelRouterMock()
        return router
    }
}

