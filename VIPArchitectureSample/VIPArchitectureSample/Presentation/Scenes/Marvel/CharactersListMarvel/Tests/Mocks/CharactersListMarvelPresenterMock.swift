//
//  CharactersListPresenterMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 20/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import XCTest
@testable import VIPArchitectureSample

final class CharactersListMarvelPresenterMock: CharactersListMarvelPresentationLogic {
  var listExpectation: XCTestExpectation!
  var detailExpectation: XCTestExpectation!
  var errorExpectation: XCTestExpectation!
  var passedCharacterList: [CharactersListMarvelItemEntity]!
  var passedId: Int!
  var passedErrorModel: ErrorModel!

  func presentResponse(_ response: CharactersListMarvelModel.Response) {

    switch response {
    case let .prepareCharactersListMarvel(data):
      passedCharacterList = data
      listExpectation.fulfill()

    case let .showDetail(id):
      passedId = id
      detailExpectation.fulfill()

    case let .showError(model):
      passedErrorModel = model
      errorExpectation.fulfill()
    }
  }
}
