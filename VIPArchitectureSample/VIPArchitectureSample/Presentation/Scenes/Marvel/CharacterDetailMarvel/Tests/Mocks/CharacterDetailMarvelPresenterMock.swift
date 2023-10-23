//
//  CharacterDetailMarvelPresenterMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharacterDetailMarvelPresenterMock: CharacterDetailMarvelPresentationLogic {
  var detailExpectation: XCTestExpectation!
  var errorExpectation: XCTestExpectation!
  var passedCharacter: CharacterDetailMarvelEntity!
  var passedErrorModel: ErrorModel!

  func presentResponse(_ response: CharacterDetailMarvelModel.Response) {

    switch response {
    case let .prepareCharactersDetail(data):
      passedCharacter = data
      detailExpectation.fulfill()

    case let .showError(model):
      passedErrorModel = model
      errorExpectation.fulfill()
    }
  }
}
