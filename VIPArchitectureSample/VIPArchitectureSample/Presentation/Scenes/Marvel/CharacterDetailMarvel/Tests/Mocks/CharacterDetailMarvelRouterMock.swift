//
//  CharacterDetailMarvelRouterMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharacterDetailMarvelRouterMock: CharacterDetailMarvelRouting {
  var passedErrorModel: ErrorModel!
  var errorExpectation: XCTestExpectation!

  func routeTo(_ route: CharacterDetailMarvelModel.Route) {

    switch route {
    case let .showError(model):
      passedErrorModel = model
      errorExpectation.fulfill()
    }
  }
}
