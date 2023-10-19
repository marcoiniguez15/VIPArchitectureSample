//
//  CharacterListMarvelServiceTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 3/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharacterListMarvelServiceTests: XCTestCase {
    var characterListMarvelService: APIEndpoint!


    override func setUp() {
        characterListMarvelService = CharacterListMarvelService.getCharactersListMarvel(page: 0)
    }

    func testGetCharactersService() {
        XCTAssertEqual(characterListMarvelService.method, .get)
        XCTAssertEqual(characterListMarvelService.contentType, .formUrlEncoded)
        let path =  characterListMarvelService.scheme + characterListMarvelService.basePath + characterListMarvelService.path
        XCTAssertNotNil(path.range(of: "gateway.marvel.com:443"))
        XCTAssertNotNil(characterListMarvelService.header)
        XCTAssertNil(characterListMarvelService.body)
    }

}
