//
//  CharactersListMarvelViewControllerTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 20/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharactersListMarvelViewControllerTests: XCTestCase {

    private var interactor: CharactersListMarvelInteractorMock!
    private var viewController: CharactersListMarvelViewController!
    private var router: CharactersListMarvelRouterMock!
    private var mainView = CharactersListMarvelViewMock()


    override func setUp() {
        viewController = CharactersListMarvelViewController(factory: self,
                                                            mainView: mainView,
                                                            dataSource: CharactersListMarvelModel.DataSource())
    }

    override func tearDown() {
        interactor = nil
        viewController = nil
        router = nil
    }
}



// MARK: - Tests
extension CharactersListMarvelViewControllerTests {

    func testItemPressed() {
        router.showDetailExpectation = expectation(description: "showDetailExpectation")
        let testId = 500
        viewController.displayViewModel(.showDetail(id: 500))
        wait(for: [router.showDetailExpectation], timeout: 0.1)
        XCTAssertEqual(testId, router.passedId)
    }

    func testShowError() {
        router.errorExpectation = expectation(description: "errorExpectation")
        let testErrorModel = ErrorHelper.createGenericError()
        viewController.displayViewModel(.showError(model: testErrorModel))
        wait(for: [router.errorExpectation], timeout: 0.1)
        XCTAssertEqual(testErrorModel.message, router.passedErrorModel.message)

    }

    func testPrepareCharactersList() {
        mainView.showListExpectation = expectation(description: "showListExpectation")
        let testViewData = CharactersListMarvelModel.ViewDataSource(title: "Title", items: [])
        viewController.displayViewModel(.prepareCharactersListMarvel(viewModelData: testViewData))
        wait(for: [mainView.showListExpectation], timeout: 0.1)
        XCTAssertTrue(mainView.updateDataSourceCalled)
    }
}


// MARK: - Factorable, Injector
extension CharactersListMarvelViewControllerTests: CharactersListMarvelFactorable {

    func makeInteractor(factory: InteractableFactory,
                        viewController: CharactersListMarvelDisplayLogic?,
                        dataSource: CharactersListMarvelModel.DataSource) -> CharactersListMarvelInteractable {
        interactor = CharactersListMarvelInteractorMock(dataSource: dataSource)
        return interactor
    }

    func makeRouter(viewController: UIViewController?) -> CharactersListMarvelRouting {
        router = CharactersListMarvelRouterMock()
        return router
    }
}
