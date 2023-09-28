//
//  CharacterDetailMarvelRepositoryContract.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//


protocol CharacterDetailMarvelRepositoryContract {
    func getCharacterDetailMarvel(id: Int) async throws -> CharacterDetailMarvelEntity
}

