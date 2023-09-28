//
//  ArtistsListService.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation
import Alamofire


enum ArtistsListService {
    case getCharactersListLastFM(limit: Int, page: Int)
}

extension ArtistsListService: APIEndpoint {
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
        case let .getCharactersListLastFM(limit, page):
          let apiKey = EnvironmentService.getValue(for: .URL(.apiKeyLASTFM))
          let method = "chart.gettopartists"

          return "/?method=\(method)&api_key=\(apiKey)&format=json"
          + "&\(APIParameterKey.limit.rawValue)=\(limit)"
          + "&\(APIParameterKey.page.rawValue)=\(page)"
        }
    }

    var contentType: ContentType {
        .formUrlEncoded
    }
}
