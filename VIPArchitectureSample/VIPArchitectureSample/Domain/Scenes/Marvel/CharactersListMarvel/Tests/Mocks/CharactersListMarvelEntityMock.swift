//
//  CharactersListMarvelEntityMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 4/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

extension CharactersListMarvelEntity {
    public static func dummyInstance() -> CharactersListMarvelEntity {
        return CharactersListMarvelEntity(items: CharactersListMarvelItemEntity.dummyInstance())
    }
}

extension CharactersListMarvelItemEntity {
    public static func dummyInstance() -> [CharactersListMarvelItemEntity] {
        [CharactersListMarvelItemEntity(name: "Hulk", id: 1, imageName: nil)]
    }
}
