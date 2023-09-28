//
//  FetchArtistsListUseCase.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

public struct FetchArtistsListUseCaseParameters {
    let limit: Int
    let page: Int

    public init (page: Int = 0, limit: Int = 0) {
        self.page = page
        self.limit = limit
    }
}
protocol FetchArtistsListUseCaseContract {
    func execute(_ params: FetchArtistsListUseCaseParameters) async throws -> ArtistsListEntity
}

final class FetchArtistsListUseCase: FetchArtistsListUseCaseContract {
    let repository: ArtistsListRepositoryContract =  ArtistsListRepository()

    func execute(_ params: FetchArtistsListUseCaseParameters) async throws -> ArtistsListEntity {
        do {
            return try await repository.getCharactersListLastFM(limit: params.limit, page: params.page)
        } catch {
            throw error
        }
    }
}
