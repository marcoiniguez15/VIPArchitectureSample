//
//  ArtistsLastFM.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import Foundation

// MARK: - Item

/// _Artist_ is a model representation of a music artist
struct ArtistsLastFM: Codable {
    let artists: ArtistsClass?
}

struct ArtistsClass: Codable {
    let page, perPage, totalPages, total: String?
    let artist: [Artist]?
    
    enum CodingKeys: String, CodingKey {
        case page = "-page"
        case perPage = "-perPage"
        case totalPages = "-totalPages"
        case total = "-total"
        case artist
    }
}

struct Artist: Codable {
    let name, playcount, listeners, mbid: String?
    let url: String?
    let streamable: String?
    let image: [Image]?
}

struct Image: Codable {
    let size: String?
    let text: String?
    
    enum CodingKeys: String, CodingKey {
        case size = "-size"
        case text = "#text"
    }
}
struct ArtistsConstants {
    static let imageKey = "image"
    static let imageSizeKey = "size"
    static let imageSizeValue = "extralarge"
    static let imageURLKey = "#text"
}
