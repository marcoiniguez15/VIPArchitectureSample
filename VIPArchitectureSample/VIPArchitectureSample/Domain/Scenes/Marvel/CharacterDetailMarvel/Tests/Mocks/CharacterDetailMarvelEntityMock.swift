//
//  CharacterDetailMarvelEntityMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

extension CharacterDetailMarvelEntity {
    public static func dummyInstance() -> CharacterDetailMarvelEntity {
        return CharacterDetailMarvelEntity(name: "Hulk", id: 1, imageName: nil, comics: [], events: [], series: [], stories: [])
    }
}
