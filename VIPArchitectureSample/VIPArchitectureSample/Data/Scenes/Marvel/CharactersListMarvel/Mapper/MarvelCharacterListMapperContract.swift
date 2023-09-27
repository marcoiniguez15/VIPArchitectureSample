//

import Foundation

protocol MarvelCharacterListMapperContract {
    func map(_ data: CharactersListMarvel) throws -> CharactersListMarvelEntity
}
