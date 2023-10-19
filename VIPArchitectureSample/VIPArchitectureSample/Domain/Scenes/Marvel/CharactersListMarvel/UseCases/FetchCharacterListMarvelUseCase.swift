//

import Foundation

public struct FetchCharacterListMarvelUseCaseParameters {
    let page: Int

    public init (page: Int = 0) {
        self.page = page
    }
}
protocol FetchCharacterListMarvelUseCaseContract {
    func execute(_ params: FetchCharacterListMarvelUseCaseParameters) async throws -> CharactersListMarvelEntity
}

final class FetchCharacterListMarvelUseCase: FetchCharacterListMarvelUseCaseContract {
    var repository: CharacterListMarvelRepositoryContract

    init(repository: CharacterListMarvelRepositoryContract = CharacterListMarvelRepository()) {
        self.repository = repository
    }

    func execute(_ params: FetchCharacterListMarvelUseCaseParameters) async throws -> CharactersListMarvelEntity {
        do {
            return try await repository.getCharactersListMarvel(page: params.page)
        } catch {
            throw error
        }
    }
}
