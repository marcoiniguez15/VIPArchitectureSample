//
//  CharacterDetailMarvelRepositoryTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample


final class CharacterDetailMarvelRepositoryTests: XCTestCase {

    var sut: CharacterDetailMarvelRepository!
    var marvelCharacterDetailMapper: MarvelCharacterDetailMapperContract!
    var mockApiService: APIClientProtocol!

    override func setUp() {
        super.setUp()
        marvelCharacterDetailMapper = MarvelCharacterDetailMapper()
        mockApiService = APIClientMock()
        sut = CharacterDetailMarvelRepository(apiClient: mockApiService, mapper: marvelCharacterDetailMapper)
    }

    func testGetCharacterDetailSuccess() async throws {
        let result = try await sut.getCharacterDetailMarvel(id: 1011334)
        XCTAssertEqual(1011334, result.id)
    }

    func testGetCharacterDetailFailure() async throws {
        do {
            mockApiService = APIClientMock(apiError: .serverError)
            sut = CharacterDetailMarvelRepository(apiClient: mockApiService, mapper: marvelCharacterDetailMapper)
            let _ = try await sut.getCharacterDetailMarvel(id: 1)
        } catch {
            XCTAssertEqual(CustomNetworkError.serverError, error as? CustomNetworkError)
        }
    }

    func testGetCharacterIdNilFailure() async throws {
        do {
            mockApiService = APIClientMock(mockErrorResponse: R.file.characterListMarvelErrorJson()!.path)
            sut = CharacterDetailMarvelRepository(apiClient: mockApiService, mapper: marvelCharacterDetailMapper)
            let _ = try await sut.getCharacterDetailMarvel(id: 1)
        } catch {
            guard case let .invalidValue(_, context) = error as? EncodingError else {
                XCTFail("testGetCharacterIdNilFailure Invalid error thrown")
                return
            }
            XCTAssertEqual(String(describing: context.codingPath[0].stringValue), "id")
        }
    }
}



