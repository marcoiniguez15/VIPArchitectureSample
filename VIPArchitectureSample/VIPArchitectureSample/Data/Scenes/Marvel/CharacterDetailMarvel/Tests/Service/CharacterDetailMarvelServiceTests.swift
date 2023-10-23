//
//  CharacterDetailMarvelServiceTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharacterDetailMarvelServiceTests: XCTestCase {
    var characterDetailMarvelService: APIEndpoint!

    override func setUp() {
        characterDetailMarvelService = CharacterDetailMarvelService.getCharacterDetailMarvel(id: 1)
    }

    func testGetCharactersService() {
        XCTAssertEqual(characterDetailMarvelService.method, .get)
        XCTAssertEqual(characterDetailMarvelService.contentType, .formUrlEncoded)
        let path =  characterDetailMarvelService.scheme + characterDetailMarvelService.basePath + characterDetailMarvelService.path
        XCTAssertNotNil(path.range(of: "gateway.marvel.com:443"))
        XCTAssertNotNil(characterDetailMarvelService.header)
        XCTAssertNil(characterDetailMarvelService.body)
    }

}
