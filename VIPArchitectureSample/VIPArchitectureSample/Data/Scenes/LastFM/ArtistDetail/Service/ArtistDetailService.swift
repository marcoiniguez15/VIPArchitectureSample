//
//  ArtistDetailService.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation
import Alamofire


enum ArtistDetailService {
    case getAlbumsListLastFM(characterId: String, limit: Int)
}

extension ArtistDetailService: APIEndpoint {
    var basePath: String {
        return EnvironmentService.getValue(for: .URL(.baseURLLastFM))
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
        case let .getAlbumsListLastFM(id, limit):
          let apiKey = EnvironmentService.getValue(for: .URL(.apiKeyLASTFM))
          let method = "artist.gettopalbums"

          return "/?method=\(method)&api_key=\(apiKey)&mbid=\(id)&format=json"
          + "&\(APIParameterKey.limit.rawValue)=\(limit)"
        }
    }

    var contentType: ContentType {
        .formUrlEncoded
    }
}
