//
//  FetchArtistDetailUseCase.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

public struct FetchArtistDetailUseCaseParameters {
    let characterId: String
    let limit: Int

    public init (characterId: String, limit: Int = 0) {
        self.characterId = characterId
        self.limit = limit
    }
}
protocol FetchArtistDetailUseCaseContract {
    func execute(_ params: FetchArtistDetailUseCaseParameters) async throws -> ArtistDetailEntity
}

final class FetchArtistDetailUseCase: FetchArtistDetailUseCaseContract {
    let repository: ArtistDetailRepositoryContract =  ArtistDetailRepository()

    func execute(_ params: FetchArtistDetailUseCaseParameters) async throws -> ArtistDetailEntity {
        do {
            return try await repository.getAlbumsListLastFM(characterId: params.characterId, limit: params.limit)
        } catch {
            throw error
        }
    }
}
