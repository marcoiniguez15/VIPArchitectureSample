//
//  CharactersListRickMortyServiceTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 24/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharactersListRickMortyServiceTests: XCTestCase {
    var charactersListMarvelService: APIEndpoint!

    override func setUp() {
        charactersListMarvelService = CharactersListRickMortyService.getAllCharactersRickAndMorty(page: 1, nameFilter: nil)
    }

    func testGetCharactersService() {
        XCTAssertEqual(charactersListMarvelService.method, .get)
        XCTAssertEqual(charactersListMarvelService.contentType, .formUrlEncoded)
        let path =  charactersListMarvelService.scheme + charactersListMarvelService.basePath + charactersListMarvelService.path
        XCTAssertNotNil(path.range(of: "rickandmortyapi.com"))
        XCTAssertNotNil(charactersListMarvelService.header)
        XCTAssertNil(charactersListMarvelService.body)
    }

}
