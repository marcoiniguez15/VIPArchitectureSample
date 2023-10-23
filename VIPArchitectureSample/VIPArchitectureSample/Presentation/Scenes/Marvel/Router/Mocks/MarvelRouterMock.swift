//
//  MarvelRouterMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 20/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//
import XCTest
@testable import VIPArchitectureSample

class MarvelRouterMock: MarvelRouter {
    var listExpectation: XCTestExpectation!
    var detailExpectation: XCTestExpectation!
    var errorExpectation: XCTestExpectation!
    public var routeToCharactersListCalled = false
    public var routeToCharacterDetailCalled = false
    public var errorCalled = false
    static let sharedMock = MarvelRouterMock()

    override init() {
    }
    // MARK: - Routing methods
    public override func routeToCharactersList(sourceViewController: UIViewController) {
        routeToCharactersListCalled = true
        listExpectation.fulfill()
    }
    public override func routeToCharacterDetail(sourceViewController: UIViewController, characterId: Int) {
        routeToCharacterDetailCalled = true
        detailExpectation.fulfill()
    }
    override func showError(sourceViewController: UIViewController, model: ErrorModel) {
        errorCalled = true
        errorExpectation.fulfill()
    }
}
