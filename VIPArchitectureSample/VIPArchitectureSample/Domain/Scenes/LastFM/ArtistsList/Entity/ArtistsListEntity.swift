//
//  ArtistsListEntity.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct ArtistsListEntity {
  let items: [ArtistsListItemEntity]
}

extension ArtistsListEntity: Equatable {
}

