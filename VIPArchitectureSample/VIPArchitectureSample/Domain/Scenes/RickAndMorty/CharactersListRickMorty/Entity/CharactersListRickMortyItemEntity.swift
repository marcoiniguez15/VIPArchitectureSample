//
//  CharactersListRickMortyItemEntity.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct CharactersListRickMortyItemEntity {
    let name: String
    let imageURL: URL?
    let status: String?
    let species: String?
}

extension CharactersListRickMortyItemEntity: Equatable {
}
