//
//  FetchCharacterListRickMortyUseCaseTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 24/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class FetchCharacterListRickMortyUseCaseTests: XCTestCase {
    var fetchCharacterListUseCase: FetchCharacterListRickMortyUseCaseContract!
    var repositoryMock: CharactersListRickMortyRepositoryMock!

    override func setUp() {
        super.setUp()
        repositoryMock = CharactersListRickMortyRepositoryMock()
        fetchCharacterListUseCase = FetchCharacterListRickMortyUseCase(repository: repositoryMock)

    }

    func testFetchCharacterListUseCaseSuccess() async throws {
        repositoryMock.response = .success(CharactersListRickMortyEntity.dummyInstance())
        let params = FetchCharacterListRickMortyUseCaseParameters(page: 0, nameFilter: nil)
        let model = try await fetchCharacterListUseCase.execute(params)
        XCTAssertEqual(model.items.count, 1)
    }

    func testFetchCharacterListUseCaseFailure() async throws {
        repositoryMock.response = .failure(CustomNetworkError.connectionError)
        let params = FetchCharacterListRickMortyUseCaseParameters(page: 0, nameFilter: nil)
        do {
            _ = try await fetchCharacterListUseCase.execute(params)
        } catch {
            XCTAssertEqual(error as? CustomNetworkError, .connectionError)
        }
    }
}
