//
//  CharactersListInteractorMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 20/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

 @testable import VIPArchitectureSample

final class CharactersListMarvelInteractorMock: CharactersListMarvelInteractable {
  var dataSource: CharactersListMarvelModel.DataSource

  var passedIndex: Int!
  var passedPage: Int!

  init(dataSource: CharactersListMarvelModel.DataSource) {
    self.dataSource = dataSource
  }

  func doRequest(_ request: CharactersListMarvelModel.Request) {

    switch request {
    case let .itemPressed(index):
      passedIndex = index

    case let .prepareCharactersListMarvel(page):
      passedPage = page
    }
  }
}
