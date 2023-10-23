//
//  FetchCharacterListMarvelUseCaseMock.swift
//  VIPArchitectureSampleTests
//
//  Created by marco.iniguez.ollero on 4/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

class FetchCharacterListMarvelUseCaseMock: FetchCharacterListMarvelUseCaseContract {
    var result: Result<CharactersListMarvelEntity, Error>?
    var passedPage: Int?

    func execute(_ params: FetchCharacterListMarvelUseCaseParameters) async throws -> CharactersListMarvelEntity {
        passedPage = params.page
        guard let result = result else {
            fatalError("Result must be provided before you make use of \(String(describing: type(of: self)))")
        }
        return try result.get()
    }

}

