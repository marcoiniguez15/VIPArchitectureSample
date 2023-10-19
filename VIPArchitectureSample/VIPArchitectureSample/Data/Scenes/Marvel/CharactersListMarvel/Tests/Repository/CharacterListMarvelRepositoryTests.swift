//
//  CharacterListMarvelRepository.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 2/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample


final class CharacterListMarvelRepositoryTests: XCTestCase {

    var sut: CharacterListMarvelRepository!
    var marvelCharacterListMapper: MarvelCharacterListMapperContract!
    var mockApiService: APIClientProtocol!


    override func setUp() {
        super.setUp()
        marvelCharacterListMapper = MarvelCharacterListMapper()
        mockApiService = APIClientMock()
        sut = CharacterListMarvelRepository(apiClient: mockApiService, mapper: marvelCharacterListMapper)
    }

    func testGetCharactersSuccess() async throws {
        let result = try await sut.getCharactersListMarvel(page: 0)
        XCTAssertEqual(5, result.items.count)
    }

    func testGetCharactersFailure() async throws {
        do {
            mockApiService = APIClientMock(apiError: .serverError)
            sut = CharacterListMarvelRepository(apiClient: mockApiService, mapper: marvelCharacterListMapper)
            let _ = try await sut.getCharactersListMarvel(page: 0)
        } catch {
            XCTAssertEqual(CustomNetworkError.serverError, error as? CustomNetworkError)
        }
    }

    func testGetCharactersIdNilFailure() async throws {
        do {
            mockApiService = APIClientMock(mockErrorResponse: R.file.characterListMarvelErrorJson()!.path)
            sut = CharacterListMarvelRepository(apiClient: mockApiService, mapper: marvelCharacterListMapper)
            let _ = try await sut.getCharactersListMarvel(page: 0)
        } catch {
            guard case let .invalidValue(_, context) = error as? EncodingError else {
                XCTFail("testGetCharactersIdNilFailure Invalid error thrown")
                return
            }
            XCTAssertEqual(String(describing: context.codingPath[0].stringValue), "id")
        }
    }
}



