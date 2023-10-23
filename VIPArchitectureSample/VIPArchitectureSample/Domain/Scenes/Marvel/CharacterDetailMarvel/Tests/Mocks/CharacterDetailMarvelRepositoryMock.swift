//
//  CharacterDetailMarvelRepositoryMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

class CharacterDetailMarvelRepositoryMock: CharacterDetailMarvelRepositoryContract {
    var response: Result<CharacterDetailMarvelEntity, Error>?

    func getCharacterDetailMarvel(id: Int) async throws -> CharacterDetailMarvelEntity {
        guard let result = response else {
            fatalError("GetCharacterDetailMarvel Response not provided")
        }
        switch result {
        case .success(let model):
            return model
        case .failure(let error):
            throw error
        }
    }
}
