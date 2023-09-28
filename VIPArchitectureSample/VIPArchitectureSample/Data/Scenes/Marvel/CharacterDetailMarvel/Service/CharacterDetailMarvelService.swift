//
//  CharacterDetailMarvelService.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation
enum CharacterDetailMarvelService {
    case getCharacterDetailMarvel(id: Int)
}

extension CharacterDetailMarvelService: APIEndpoint {
    var basePath: String {
        return EnvironmentService.getValue(for: .URL(.baseURLMarvel))
    }

    var method: RequestMethod {
        .get
    }

    var header: [String : String]? {
        return [
            HTTPHeaderField.acceptType.rawValue : HeadersParams.defaultAccept.rawValue,
            HTTPHeaderField.connection.rawValue :  HeadersParams.keepAlive.rawValue ,
            HTTPHeaderField.acceptEncoding.rawValue :  HeadersParams.gzipDeflateBr.rawValue ,
            HTTPHeaderField.contentType.rawValue : contentType.rawValue
        ]
    }

    var body: [String : String]? {
        nil
    }

    var path: String {
        switch self {
        case let .getCharacterDetailMarvel(id):
          let timestamp = Int(Date().timeIntervalSince1970)
          let publicKey = EnvironmentService.getValue(for: .URL(.publicKeyMarvel))
          let privateKey = EnvironmentService.getValue(for: .URL(.privateKeyMarvel))
          let hash = "\(timestamp)\(privateKey)\(publicKey)"
          return "/v1/public/characters/\(id)" + "?\(APIParameterKey.timestamp.rawValue)=\(timestamp)"
            + "&\(APIParameterKey.hash.rawValue)=\(hash.md5())"
            + "&\(APIParameterKey.apiKey.rawValue)=\(publicKey)"
        }
    }

    var contentType: ContentType {
        .formUrlEncoded
    }
}
