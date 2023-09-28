//
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct CharacterDetailMarvelEntity {
    let name: String
    let id: Int
    let imageName: String?
    let comics: [CharacterDetailItemEntity]
    let events: [CharacterDetailItemEntity]
    let series: [CharacterDetailItemEntity]
    let stories: [CharacterDetailItemEntity]
}

extension CharacterDetailMarvelEntity: Equatable {
}

