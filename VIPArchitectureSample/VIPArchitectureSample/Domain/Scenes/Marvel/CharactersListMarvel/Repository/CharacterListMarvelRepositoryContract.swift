typealias CharacterListMarvelRepositoryResult = CharactersListMarvel
protocol CharacterListMarvelRepositoryContract {
    func getCharactersListMarvel(page: Int) async throws -> CharactersListMarvelEntity
}

