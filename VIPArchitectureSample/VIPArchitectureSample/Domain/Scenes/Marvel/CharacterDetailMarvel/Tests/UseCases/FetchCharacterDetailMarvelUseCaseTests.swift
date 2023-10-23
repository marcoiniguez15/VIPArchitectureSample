//
//  FetchCharacterDetailMarvelUseCaseTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class FetchCharacterDetailMarvelUseCaseTests: XCTestCase {
    var fetchCharacterDetailMarvelUseCase: FetchCharacterDetailMarvelUseCaseContract!
    var repositoryMock: CharacterDetailMarvelRepositoryMock!

    override func setUp() {
        super.setUp()
        repositoryMock = CharacterDetailMarvelRepositoryMock()
        fetchCharacterDetailMarvelUseCase = FetchCharacterDetailMarvelUseCase(repository: repositoryMock)

    }

    func testFetchCharacterDetailMarvelUseCaseSuccess() async throws {
        repositoryMock.response = .success(CharacterDetailMarvelEntity.dummyInstance())
        let params = FetchCharacterDetailMarvelUseCaseParameters(id: 1)
        let model = try await fetchCharacterDetailMarvelUseCase.execute(params)
        XCTAssertEqual(model.id, params.id)
    }

    func testFetchCharacterListMarvelUseCaseFailure() async throws {
        repositoryMock.response = .failure(CustomNetworkError.connectionError)
        let params = FetchCharacterDetailMarvelUseCaseParameters(id: 1)
        do {
            _ = try await fetchCharacterDetailMarvelUseCase.execute(params)
        } catch {
            XCTAssertEqual(error as? CustomNetworkError, .connectionError)
        }
    }
}
