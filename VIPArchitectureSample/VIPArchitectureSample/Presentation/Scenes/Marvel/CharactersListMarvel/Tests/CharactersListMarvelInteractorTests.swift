//
//  CharactersListMarvelInteractorTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 20/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//
import XCTest
@testable import VIPArchitectureSample


final class CharactersListMarvelInteractorTests: XCTestCase {

    private var presenter: CharactersListMarvelPresenterMock!
    private var interactor: CharactersListMarvelInteractor!
    private var fetchCharacterListMarvelUseCaseMock: FetchCharacterListMarvelUseCaseMock!

    override func setUp() {
        interactor = CharactersListMarvelInteractor(factory: self, viewController: nil, dataSource: CharactersListMarvelModel.DataSource())
        fetchCharacterListMarvelUseCaseMock = interactor.fetchCharacterListMarvelUseCase as? FetchCharacterListMarvelUseCaseMock
    }

    override func tearDown() {
        presenter = nil
        interactor = nil
        fetchCharacterListMarvelUseCaseMock =  nil
    }
}


// MARK: - Tests
extension CharactersListMarvelInteractorTests {

    func testItemPressed() {
        presenter.detailExpectation = expectation(description: "detailExpectation")
        presenter.listExpectation = expectation(description: "listExpectation")
        fetchCharacterListMarvelUseCaseMock.result = .success(.dummyInstance())
        let testIndex = 0
        let testId = 1
        interactor.doRequest(.prepareCharactersListMarvel(page: 0))
        wait(for: [presenter.listExpectation], timeout: 0.1)
        interactor.doRequest(.itemPressed(index: testIndex))
        wait(for: [presenter.detailExpectation], timeout: 0.1)
        XCTAssertEqual(testId, presenter.passedId)
    }

    func testShowList() {
        fetchCharacterListMarvelUseCaseMock.result = .success(.dummyInstance())
        presenter.listExpectation = expectation(description: "listExpectation")
        let testPage = 0
        interactor.doRequest(.prepareCharactersListMarvel(page: testPage))
        wait(for: [presenter.listExpectation], timeout: 0.1)
        XCTAssertEqual(testPage, fetchCharacterListMarvelUseCaseMock.passedPage)
    }

    func testShowError() {
        presenter.errorExpectation = expectation(description: "errorExpectation")
        fetchCharacterListMarvelUseCaseMock.result = .failure(CustomNetworkError.connectionError)
        let testPage = 1
        interactor.doRequest(.prepareCharactersListMarvel(page: testPage))
        let testErrorModel = ErrorHelper.createGenericError()
        wait(for: [presenter.errorExpectation], timeout: 0.1)
        XCTAssertEqual(testPage, fetchCharacterListMarvelUseCaseMock.passedPage)
        XCTAssertEqual(testErrorModel.message, presenter.passedErrorModel.message)
    }

}


// MARK: - CharactersListMarvelFactorable
extension CharactersListMarvelInteractorTests: CharactersListMarvelFactorable {

    func makePresenter(viewController: CharactersListMarvelDisplayLogic?) -> CharactersListMarvelPresentationLogic {
        presenter = CharactersListMarvelPresenterMock()
        return presenter
    }

    func makeFetchCharactersUseCase() -> FetchCharacterListMarvelUseCaseContract {
        FetchCharacterListMarvelUseCaseMock()
    }
}

