//

import Foundation

struct MarvelCharacterListMapper: MarvelCharacterListMapperContract {
    func map(_ data: CharactersListMarvel) throws -> CharactersListMarvelEntity {

        var result: [CharactersListMarvelItemEntity] = []

        if let data = data.data, let results = data.results {
            for character in results {
                var imageName: String?
                if let thumbnail = character.thumbnail, let path = thumbnail.path, let exten = thumbnail.exten {
                    imageName = path + "." + exten
                }
                guard let id = character.id else {
                    let errorContext = EncodingError.Context(codingPath: [ResultList.CodingKeys.id], debugDescription: "Id is nil")
                    throw EncodingError.invalidValue(self, errorContext)
                }
                if let name = character.name {
                    let item = CharactersListMarvelItemEntity(name: name, id: id, imageName: imageName)
                    result.append(item)
                }
            }
        }
        return CharactersListMarvelEntity(items: result)
    }
}


