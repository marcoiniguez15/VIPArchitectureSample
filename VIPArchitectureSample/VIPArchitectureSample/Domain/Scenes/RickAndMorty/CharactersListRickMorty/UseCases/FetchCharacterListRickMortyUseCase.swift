//
//  FetchCharacterListRickMortyUseCase.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

public struct FetchCharacterListRickMortyUseCaseParameters {
    let page: Int
    let nameFilter: String?

    public init (page: Int = 0, nameFilter: String?) {
        self.page = page
        self.nameFilter = nameFilter
    }
}
protocol FetchCharacterListRickMortyUseCaseContract {
    func execute(_ params: FetchCharacterListRickMortyUseCaseParameters) async throws -> CharactersListRickMortyEntity
}

final class FetchCharacterListRickMortyUseCase: FetchCharacterListRickMortyUseCaseContract {
    let repository: CharactersListRickMortyRepositoryContract =  CharactersListRickMortyRepository()

    func execute(_ params: FetchCharacterListRickMortyUseCaseParameters) async throws -> CharactersListRickMortyEntity {
        do {
            return try await repository.getAllCharactersRickAndMorty(page: params.page, nameFilter: params.nameFilter)
        } catch {
            throw error
        }
    }
}
