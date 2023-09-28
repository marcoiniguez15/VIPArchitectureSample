//
//  MarvelCharacterDetailMapperContract.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

protocol MarvelCharacterDetailMapperContract {
    func map(_ data: CharactersListMarvel) throws -> CharacterDetailMarvelEntity
}
