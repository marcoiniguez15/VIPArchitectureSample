//
//  CharactersListRickMortyRepositoryContract.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

protocol CharactersListRickMortyRepositoryContract {
    func getAllCharactersRickAndMorty(page: Int, nameFilter: String?) async throws -> CharactersListRickMortyEntity
}



