import Foundation

struct CharacterListMarvelRepository: CharacterListMarvelRepositoryContract {
    let apiClient: APIClientNewProtocol
    let marvelCharacterListMapper: MarvelCharacterListMapper


    init(apiClient: APIClientNew = APIClientNew.shared, mapper:MarvelCharacterListMapper = MarvelCharacterListMapper()) {
        self.apiClient = apiClient
        self.marvelCharacterListMapper = mapper
    }

    func getCharactersListMarvel(page: Int) async throws -> CharactersListMarvelEntity {
        let service = CharacterListMarvelService.getCharactersListMarvel(page: page)

         let result = try await apiClient.performRequest(endpoint: service, responseModel: CharactersListMarvel.self)
         return try marvelCharacterListMapper.map(result)
    }
}
