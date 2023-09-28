//
//  ArtistsListItemEntity.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct ArtistsListItemEntity {
  let name: String
  let id: String
  let imageURL: URL?
}

extension ArtistsListItemEntity: Equatable {
}

