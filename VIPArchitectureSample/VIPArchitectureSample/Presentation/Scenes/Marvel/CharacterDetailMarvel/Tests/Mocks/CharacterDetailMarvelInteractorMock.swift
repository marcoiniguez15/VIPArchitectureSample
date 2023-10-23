//
//  CharacterDetailMarvelInteractorMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

@testable import VIPArchitectureSample

final class CharacterDetailMarvelInteractorMock: CharacterDetailMarvelInteractable {

 var dataSource: CharacterDetailMarvelModel.DataSource

 var characterId: Int!

 init(dataSource: CharacterDetailMarvelModel.DataSource) {
   self.dataSource = dataSource
 }

func doRequest(_ request: VIPArchitectureSample.CharacterDetailMarvelModel.Request) {

    switch request {
    case .prepareCharactersDetail:
        characterId = dataSource.characterId
    }
 }
}
