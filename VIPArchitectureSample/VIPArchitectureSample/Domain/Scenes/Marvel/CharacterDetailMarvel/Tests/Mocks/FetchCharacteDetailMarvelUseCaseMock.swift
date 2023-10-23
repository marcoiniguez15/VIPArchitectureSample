//
//  FetchCharacteDetailMarvelUseCaseMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

class FetchCharacterDetailMarvelUseCaseMock: FetchCharacterDetailMarvelUseCaseContract {
    var result: Result<CharacterDetailMarvelEntity, Error>?
    var passedId: Int?

    func execute(_ params: FetchCharacterDetailMarvelUseCaseParameters) async throws -> CharacterDetailMarvelEntity {
        passedId = params.id
        guard let result = result else {
            fatalError("Result must be provided before you make use of \(String(describing: type(of: self)))")
        }
        return try result.get()
    }

}

