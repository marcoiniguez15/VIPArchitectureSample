//
//  MarvelCharacterDetailMapper.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation
struct MarvelCharacterDetailMapper: MarvelCharacterDetailMapperContract {
    func map(_ data: CharactersListMarvel) throws -> CharacterDetailMarvelEntity {

        if let data = data.data, let results = data.results, let character = results.first {
            var imageName: String?
            if let thumbnail = character.thumbnail, let path = thumbnail.path, let exten = thumbnail.exten {
                imageName = path + "." + exten
            }
            guard let id = character.id else {
                let errorContext = EncodingError.Context(codingPath: [ResultList.CodingKeys.id], debugDescription: "Id is nil")
                throw EncodingError.invalidValue(self, errorContext)
            }

            var comics: [CharacterDetailItemEntity] = []
            if let items = character.comics?.items {
                for item in items {
                    if let name = item.name {
                        comics.append(CharacterDetailItemEntity(name: name))
                    }
                }
            }

            var series: [CharacterDetailItemEntity] = []
            if let items = character.series?.items {
                for item in items {
                    if let name = item.name {
                        series.append(CharacterDetailItemEntity(name: name))
                    }
                }
            }

            var stories: [CharacterDetailItemEntity] = []
            if let items = character.stories?.items {
                for item in items {
                    if let name = item.name {
                        stories.append(CharacterDetailItemEntity(name: name))
                    }
                }
            }

            var events: [CharacterDetailItemEntity] = []
            if let items = character.events?.items {
                for item in items {
                    if let name = item.name {
                        events.append(CharacterDetailItemEntity(name: name))
                    }
                }
            }

            if let name = character.name {
                return CharacterDetailMarvelEntity(name: name, id: id, imageName: imageName, comics: comics, events: events, series: series, stories: stories)
            }
        }
        throw CustomNetworkError.decode
    }
}


