//
//  CharactersListRickMortyRepositoryTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 24/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample


final class CharactersListRickMortyRepositoryTests: XCTestCase {

    var sut: CharactersListRickMortyRepository!
    var characterListMapper: CharactersListRickMortyMapperContract!
    var mockApiService: APIClientProtocol!

    override func setUp() {
        super.setUp()
        characterListMapper = CharactersListRickMortyMapper()
        mockApiService = APIClientMock()
        sut = CharactersListRickMortyRepository(apiClient: mockApiService, mapper: characterListMapper)
    }

    func testGetCharacterListSuccess() async throws {
        let result = try await sut.getAllCharactersRickAndMorty(page: 1, nameFilter: nil)
        XCTAssertEqual("Rick", result.items.first?.name)
    }

    func testGetCharacterListFailure() async throws {
        do {
            mockApiService = APIClientMock(apiError: .serverError)
            sut = CharactersListRickMortyRepository(apiClient: mockApiService, mapper: characterListMapper)
            let _ = try await sut.getAllCharactersRickAndMorty(page: 1, nameFilter: nil)
        } catch {
            XCTAssertEqual(CustomNetworkError.serverError, error as? CustomNetworkError)
        }
    }

    func testGetCharacterNameNilFailure() async throws {
        do {
            mockApiService = APIClientMock(mockErrorResponse: R.file.characterListRickAndMortyErrorJson()!.path)
            sut = CharactersListRickMortyRepository(apiClient: mockApiService, mapper: characterListMapper)
            let _ = try await sut.getAllCharactersRickAndMorty(page: 1, nameFilter: nil)
        } catch {
            guard case let .invalidValue(_, context) = error as? EncodingError else {
                XCTFail("testGetCharacterNameNilFailure Invalid error thrown")
                return
            }
            XCTAssertEqual(CustomNetworkError.decode, error as? CustomNetworkError)
        }
    }
}



