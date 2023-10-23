//
//  CharacterDetailMarvelInteractorTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample


final class CharacterDetailMarvelInteractorTests: XCTestCase {

    private var presenter: CharacterDetailMarvelPresenterMock!
    private var interactor: CharacterDetailMarvelInteractor!
    private var fetchCharacterDetailMarvelUseCaseMock: FetchCharacterDetailMarvelUseCaseMock!

    override func setUp() {
        interactor = CharacterDetailMarvelInteractor(factory: self, viewController: nil, dataSource: CharacterDetailMarvelModel.DataSource(characterId: 1))
        fetchCharacterDetailMarvelUseCaseMock = interactor.fetchCharacterDetailMarvelUseCase as? FetchCharacterDetailMarvelUseCaseMock
    }

    override func tearDown() {
        presenter = nil
        interactor = nil
        fetchCharacterDetailMarvelUseCaseMock =  nil
    }
}


// MARK: - Tests
extension CharacterDetailMarvelInteractorTests {
    func testShowCharacter() {
        fetchCharacterDetailMarvelUseCaseMock.result = .success(.dummyInstance())
        presenter.detailExpectation = expectation(description: "detailExpectation")
        interactor.doRequest(.prepareCharactersDetail)
        wait(for: [presenter.detailExpectation], timeout: 0.1)
        XCTAssertEqual(1, fetchCharacterDetailMarvelUseCaseMock.passedId)
    }

    func testShowError() {
        presenter.errorExpectation = expectation(description: "errorExpectation")
        fetchCharacterDetailMarvelUseCaseMock.result = .failure(CustomNetworkError.connectionError)
        interactor.doRequest(.prepareCharactersDetail)
        let testErrorModel = ErrorHelper.createGenericError()
        wait(for: [presenter.errorExpectation], timeout: 0.1)
        XCTAssertEqual(1, fetchCharacterDetailMarvelUseCaseMock.passedId)
        XCTAssertEqual(testErrorModel.message, presenter.passedErrorModel.message)
    }

}


// MARK: - CharactersListMarvelFactorable
extension CharacterDetailMarvelInteractorTests: CharacterDetailMarvelFactorable {

    func makePresenter(viewController: CharacterDetailMarvelDisplayLogic?) -> CharacterDetailMarvelPresentationLogic {
        presenter = CharacterDetailMarvelPresenterMock()
        return presenter
    }

    func makeFetchCharacterUseCase() -> FetchCharacterDetailMarvelUseCaseContract {
        FetchCharacterDetailMarvelUseCaseMock()
    }
}

