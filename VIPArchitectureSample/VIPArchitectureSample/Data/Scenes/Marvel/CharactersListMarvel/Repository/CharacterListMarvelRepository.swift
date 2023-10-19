import Foundation

struct CharacterListMarvelRepository: CharacterListMarvelRepositoryContract {
    private let apiClient: APIClientProtocol
    private let marvelCharacterListMapper: MarvelCharacterListMapperContract

    init(apiClient: APIClientProtocol = APIClient.shared, mapper:MarvelCharacterListMapperContract = MarvelCharacterListMapper()) {
        self.apiClient = apiClient
        self.marvelCharacterListMapper = mapper
    }

    func getCharactersListMarvel(page: Int) async throws -> CharactersListMarvelEntity {
        let service = CharacterListMarvelService.getCharactersListMarvel(page: page)

         let result = try await apiClient.performRequest(endpoint: service, responseModel: CharactersListMarvel.self)
         return try marvelCharacterListMapper.map(result)
    }
}
