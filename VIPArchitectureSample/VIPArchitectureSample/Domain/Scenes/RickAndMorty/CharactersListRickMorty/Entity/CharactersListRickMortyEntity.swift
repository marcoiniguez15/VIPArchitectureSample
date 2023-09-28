//
//  CharactersListRickMortyEntity.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct CharactersListRickMortyEntity {
    let items: [CharactersListRickMortyItemEntity]
    let numberPages: Int
}

extension CharactersListRickMortyEntity: Equatable {
}
