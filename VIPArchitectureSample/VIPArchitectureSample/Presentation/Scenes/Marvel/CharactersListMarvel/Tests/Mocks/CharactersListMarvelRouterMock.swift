//
//  CharactersListRouterMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 20/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharactersListMarvelRouterMock: CharactersListMarvelRouting {
  var passedId: Int!
  var passedErrorModel: ErrorModel!
  var showDetailExpectation: XCTestExpectation!
  var errorExpectation: XCTestExpectation!

  func routeTo(_ route: CharactersListMarvelModel.Route) {

    switch route {
    case let .showCharacterDetailMarvel(id):
      passedId = id
      showDetailExpectation.fulfill()

    case let .showError(model):
      passedErrorModel = model
      errorExpectation.fulfill()
    }
  }
}
