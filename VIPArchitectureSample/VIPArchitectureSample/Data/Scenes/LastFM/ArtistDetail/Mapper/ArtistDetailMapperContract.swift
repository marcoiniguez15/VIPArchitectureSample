//
//  ArtistDetailMapperContract.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

protocol ArtistDetailMapperContract {
    func map(_ data: AlbumsLastFM) throws -> ArtistDetailEntity
}
