//
//  CharacterListMarvelRepositoryMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 4/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

class CharacterListMarvelRepositoryMock: CharacterListMarvelRepositoryContract {
    var response: Result<CharactersListMarvelEntity, Error>?

    func getCharactersListMarvel(page: Int) async throws -> CharactersListMarvelEntity {
        guard let result = response else {
            fatalError("GetCharactersListMarvel Response not provided")
        }
        switch result {
        case .success(let model):
            return model
        case .failure(let error):
            throw error
        }
    }
}
