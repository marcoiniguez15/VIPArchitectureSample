//
//  CharactersListRickMortyMapperContract.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

protocol CharactersListRickMortyMapperContract {
    func map(_ data: CharactersRickAndMorty) throws -> CharactersListRickMortyEntity
}
