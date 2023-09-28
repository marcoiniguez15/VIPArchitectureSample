//
//  FetchCharacterDetailMarvelUseCase.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

public struct FetchCharacterDetailMarvelUseCaseParameters {
    let id: Int

    public init (id: Int = 0) {
        self.id = id
    }
}
protocol FetchCharacterDetailMarvelUseCaseContract {
    func execute(_ params: FetchCharacterDetailMarvelUseCaseParameters) async throws -> CharacterDetailMarvelEntity
}

final class FetchCharacterDetailMarvelUseCase: FetchCharacterDetailMarvelUseCaseContract {
    let repository: CharacterDetailMarvelRepositoryContract =  CharacterDetailMarvelRepository()

    func execute(_ params: FetchCharacterDetailMarvelUseCaseParameters) async throws -> CharacterDetailMarvelEntity {
        do {
            return try await repository.getCharacterDetailMarvel(id: params.id)
        } catch {
            throw error
        }
    }
}
