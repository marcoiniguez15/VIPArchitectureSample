//
//  CharactersRickAndMorty.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import Foundation

struct CharactersRickAndMorty: Codable {
    let info: Info?
    let results: [ResultRickAndMorty]?
}

struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

struct ResultRickAndMorty: Codable {
    let id: Int?
    let name: String?
    let status: Status?
    let species, type: String?
    let gender: Gender?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}

struct Location: Codable {
    let name: String?
    let url: String?
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
