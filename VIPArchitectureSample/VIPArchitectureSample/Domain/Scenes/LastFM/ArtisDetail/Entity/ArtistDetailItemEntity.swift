//
//  ArtistDetailItemEntity.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct ArtistDetailItemEntity {
    let title: String?
    let rank: String?
    let imageURL: URL?
    let description: String?
}

extension ArtistDetailItemEntity: Equatable {
}
