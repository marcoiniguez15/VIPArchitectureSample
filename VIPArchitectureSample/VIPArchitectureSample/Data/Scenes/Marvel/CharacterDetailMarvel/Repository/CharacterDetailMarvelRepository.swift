//
//  CharacterDetailMarvelRepository.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct CharacterDetailMarvelRepository: CharacterDetailMarvelRepositoryContract {
    private let apiClient: APIClientProtocol
    private let marvelCharacterDetailMapper: MarvelCharacterDetailMapperContract


    init(apiClient: APIClient = APIClient.shared, mapper:MarvelCharacterDetailMapperContract = MarvelCharacterDetailMapper()) {
        self.apiClient = apiClient
        self.marvelCharacterDetailMapper = mapper
    }

    func getCharacterDetailMarvel(id: Int) async throws -> CharacterDetailMarvelEntity {
         let service = CharacterDetailMarvelService.getCharacterDetailMarvel(id: id)

         let result = try await apiClient.performRequest(endpoint: service, responseModel: CharactersListMarvel.self)
         return try marvelCharacterDetailMapper.map(result)
    }
}
