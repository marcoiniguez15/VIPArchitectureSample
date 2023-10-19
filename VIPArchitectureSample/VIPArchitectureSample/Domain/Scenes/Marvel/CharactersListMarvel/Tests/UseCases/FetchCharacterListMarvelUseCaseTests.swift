//
//  FetchCharacterListMarvelUseCaseTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 4/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class FetchCharacterListMarvelUseCaseTests: XCTestCase {
    var fetchCharacterListMarvelUseCase: FetchCharacterListMarvelUseCaseContract!
    var repositoryMock: CharacterListMarvelRepositoryMock!

    override func setUp() {
        super.setUp()
        repositoryMock = CharacterListMarvelRepositoryMock()
        fetchCharacterListMarvelUseCase = FetchCharacterListMarvelUseCase(repository: repositoryMock)

    }

    func testFetchCharacterListMarvelUseCaseSuccess() async throws {
        repositoryMock.response = .success(CharactersListMarvelEntity.dummyInstance())
        let params = FetchCharacterListMarvelUseCaseParameters(page: 0)
        let model = try await fetchCharacterListMarvelUseCase.execute(params)
        XCTAssertEqual(model.items.count, 1)
    }

    func testFetchCharacterListMarvelUseCaseFailure() async throws {
        repositoryMock.response = .failure(CustomNetworkError.connectionError)
        let params = FetchCharacterListMarvelUseCaseParameters(page: 0)
        do {
            _ = try await fetchCharacterListMarvelUseCase.execute(params)
        } catch {
            XCTAssertEqual(error as? CustomNetworkError, .connectionError)
        }
    }
}
