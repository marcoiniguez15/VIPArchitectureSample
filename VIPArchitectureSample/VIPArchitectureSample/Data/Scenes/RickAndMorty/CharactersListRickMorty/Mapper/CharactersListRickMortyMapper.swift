//
//  CharactersListRickMortyMapper.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//


import Foundation

struct CharactersListRickMortyMapper: CharactersListRickMortyMapperContract {
    func map(_ data: CharactersRickAndMorty) throws -> CharactersListRickMortyEntity {
        if let list = data.results, let info = data.info, let numberPages =  info.pages {
            let items = list.compactMap { character -> CharactersListRickMortyItemEntity in
                var imageURL = URL(string: "")
                if let img = character.image {
                    imageURL = URL(string: img)
                }
                return CharactersListRickMortyItemEntity(name: character.name ?? "", imageURL: imageURL, status: character.status?.rawValue, species: character.species)
            }

            return CharactersListRickMortyEntity(items: items, numberPages: numberPages)
        }
        throw CustomNetworkError.decode
    }
}
