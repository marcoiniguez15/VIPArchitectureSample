//
//  ArtistsListMapper.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 28/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

struct ArtistsListMapper: ArtistsListMapperContract {
    func map(_ data: ArtistsLastFM) throws -> ArtistsListEntity {
        if let list = data.artists, let artists = list.artist {
            let items = artists.compactMap { item -> ArtistsListItemEntity? in
                var imageURL = URL(string: "")
                if let imageArray = item.image {
                    let imageURLs = imageArray.compactMap { (imageDictionary) -> URL? in
                        if let imageSize = imageDictionary.size, imageSize == ArtistsConstants.imageSizeValue,
                           let imageURLString = imageDictionary.text {
                            return URL(string: imageURLString)
                        } else if  let imageURLString = imageDictionary.text {
                            return URL(string: imageURLString)
                        }

                        return nil
                    }
                    imageURL = imageURLs.last
                }

                if let name = item.name , let id = item.mbid {
                    return ArtistsListItemEntity(name: name, id: id, imageURL: imageURL)
                }
                return nil
            }
            return ArtistsListEntity(items: items)
        }
        throw CustomNetworkError.decode

    }
}
