//
//  ArtistsListRepositoryContract.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

protocol ArtistsListRepositoryContract {
    func getCharactersListLastFM(limit: Int, page: Int) async throws -> ArtistsListEntity
}
