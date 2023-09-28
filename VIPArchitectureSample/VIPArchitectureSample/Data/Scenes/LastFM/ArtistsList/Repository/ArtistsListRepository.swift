//
//  ArtistsListRepository.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct ArtistsListRepository: ArtistsListRepositoryContract {
    private let apiClient: APIClientProtocol
    private let mapper: ArtistsListMapperContract


    init(apiClient: APIClient = APIClient.shared, mapper:ArtistsListMapperContract = ArtistsListMapper()) {
        self.apiClient = apiClient
        self.mapper = mapper
    }

    func getCharactersListLastFM(limit: Int, page: Int) async throws -> ArtistsListEntity {
        let service = ArtistsListService.getCharactersListLastFM(limit: limit, page: page)

        let result = try await apiClient.performRequest(endpoint: service, responseModel: ArtistsLastFM.self)
        return try mapper.map(result)
    }
}
