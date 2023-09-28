//
//  ArtistDetailRepository.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct ArtistDetailRepository: ArtistDetailRepositoryContract {
    private let apiClient: APIClientProtocol
    private let mapper: ArtistDetailMapperContract


    init(apiClient: APIClient = APIClient.shared, mapper:ArtistDetailMapperContract = ArtistDetailMapper()) {
        self.apiClient = apiClient
        self.mapper = mapper
    }

    func getAlbumsListLastFM(characterId: String, limit: Int) async throws -> ArtistDetailEntity {
        let service = ArtistDetailService.getAlbumsListLastFM(characterId: characterId, limit: limit)

        let result = try await apiClient.performRequest(endpoint: service, responseModel: AlbumsLastFM.self)
        return try mapper.map(result)
    }
}
