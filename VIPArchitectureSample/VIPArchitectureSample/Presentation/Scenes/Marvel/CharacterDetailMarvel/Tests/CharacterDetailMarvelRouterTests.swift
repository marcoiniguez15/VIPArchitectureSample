//
//  CharacterDetailMarvelRouterTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample


final class CharacterDetailMarvelRouterTests: XCTestCase {

  private var router: CharacterDetailMarvelRouter!
  private var viewController: CharacterDetailMarvelViewControllerMock!
  private var routerMock: MarvelRouterMock = MarvelRouterMock.sharedMock

  override func setUp() {
    viewController = CharacterDetailMarvelViewControllerMock()
    router = CharacterDetailMarvelRouter(viewController: viewController)
  }

  override func tearDown() {
    viewController = nil
    router = nil
  }
}


// MARK: - Tests
extension CharacterDetailMarvelRouterTests {
    func testShowError() {
        routerMock.errorExpectation = expectation(description: "errorExpectation")
        router.router = routerMock
        router.routeTo(.showError(model: ErrorHelper.createGenericError()))
        wait(for: [routerMock.errorExpectation], timeout: 0.1)
        XCTAssertTrue(routerMock.errorCalled)
    }
}

