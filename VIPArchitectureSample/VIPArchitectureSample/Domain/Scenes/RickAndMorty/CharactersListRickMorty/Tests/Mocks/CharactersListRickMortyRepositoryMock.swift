//
//  CharactersListRickMortyRepositoryMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 24/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

class CharactersListRickMortyRepositoryMock: CharactersListRickMortyRepositoryContract {
    var response: Result<CharactersListRickMortyEntity, Error>?

    func getAllCharactersRickAndMorty(page: Int, nameFilter: String?) async throws -> CharactersListRickMortyEntity {
        guard let result = response else {
            fatalError("GetAllCharactersRickAndMorty Response not provided")
        }
        switch result {
        case .success(let model):
            return model
        case .failure(let error):
            throw error
        }
    }
}
