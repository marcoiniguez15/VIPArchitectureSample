//
//  FetchCharacterListRickMortyUseCaseMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 24/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

class FetchCharacterListRickMortyUseCaseMock: FetchCharacterListRickMortyUseCaseContract {
    var result: Result<CharactersListRickMortyEntity, Error>?
    var passedPage: Int?

    func execute(_ params: FetchCharacterListRickMortyUseCaseParameters) async throws -> CharactersListRickMortyEntity {
        passedPage = params.page
        guard let result = result else {
            fatalError("Result must be provided before you make use of \(String(describing: type(of: self)))")
        }
        return try result.get()
    }

}
