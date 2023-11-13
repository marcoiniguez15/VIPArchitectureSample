//
//  CharactersListRickMortyRepository.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct CharactersListRickMortyRepository: CharactersListRickMortyRepositoryContract {
    private let apiClient: APIClientProtocol
    private let mapper: CharactersListRickMortyMapperContract


    init(apiClient: APIClientProtocol = APIClient.shared, mapper:CharactersListRickMortyMapperContract = CharactersListRickMortyMapper()) {
        self.apiClient = apiClient
        self.mapper = mapper
    }

    func getAllCharactersRickAndMorty(page: Int, nameFilter: String?) async throws -> CharactersListRickMortyEntity {
        let service = CharactersListRickMortyService.getAllCharactersRickAndMorty(page: page, nameFilter: nameFilter)

        let result = try await apiClient.performRequest(endpoint: service, responseModel: CharactersRickAndMorty.self)
        return try mapper.map(result)
    }
}
