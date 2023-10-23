//
//  CharactersListMarvelRouterTests.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 20/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample


final class CharactersListMarvelRouterTests: XCTestCase {

  private var router: CharactersListMarvelRouter!
  private var viewController: CharactersListMarvelViewControllerMock!
  private var routerMock: MarvelRouterMock = MarvelRouterMock.sharedMock

  override func setUp() {
    viewController = CharactersListMarvelViewControllerMock()
    router = CharactersListMarvelRouter(viewController: viewController)
  }

  override func tearDown() {
    viewController = nil
    router = nil
  }
}


// MARK: - Tests
extension CharactersListMarvelRouterTests {
    func testShowDetail() {
        routerMock.detailExpectation = expectation(description: "detailExpectation")
        router.router = routerMock
        router.routeTo(.showCharacterDetailMarvel(id: 1))
        wait(for: [routerMock.detailExpectation], timeout: 0.1)
        XCTAssertTrue(routerMock.routeToCharacterDetailCalled)
    }

    func testShowError() {
        routerMock.errorExpectation = expectation(description: "errorExpectation")
        router.router = routerMock
        router.routeTo(.showError(model: ErrorHelper.createGenericError()))
        wait(for: [routerMock.errorExpectation], timeout: 0.1)
        XCTAssertTrue(routerMock.errorCalled)
    }

}
