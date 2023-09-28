//
//  CharactersListRickMortyService.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 27/9/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation
import Alamofire


enum CharactersListRickMortyService {
    case getAllCharactersRickAndMorty(page: Int, nameFilter: String?)
}

extension CharactersListRickMortyService: APIEndpoint {
    var basePath: String {
        return EnvironmentService.getValue(for: .URL(.baseURLRickMorty))
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
        case let .getAllCharactersRickAndMorty(page, nameFilter):
          var pathUrl = "/character/?page=\(page)"
          if let name = nameFilter {
            pathUrl += "&name=\(name)"
          }
          return pathUrl
        }
    }

    var contentType: ContentType {
        .formUrlEncoded
    }
}
