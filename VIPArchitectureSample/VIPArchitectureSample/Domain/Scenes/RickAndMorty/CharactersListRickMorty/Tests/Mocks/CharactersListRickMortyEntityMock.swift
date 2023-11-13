//
//  CharactersListRickMortyEntityMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 24/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

extension CharactersListRickMortyEntity {
    public static func dummyInstance() -> CharactersListRickMortyEntity {
        return CharactersListRickMortyEntity(items: CharactersListRickMortyItemEntity.dummyInstance(), numberPages: 1)
    }
}

extension CharactersListRickMortyItemEntity {
    public static func dummyInstance() -> [CharactersListRickMortyItemEntity] {
        [CharactersListRickMortyItemEntity(name: "Morty", imageURL: nil, status: nil, species: nil)]
    }
}
