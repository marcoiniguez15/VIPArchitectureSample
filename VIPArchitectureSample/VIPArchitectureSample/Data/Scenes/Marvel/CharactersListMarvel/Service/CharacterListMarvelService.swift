import Foundation
import Alamofire


enum CharacterListMarvelService {
    case getCharactersListMarvel(page: Int)
}

extension CharacterListMarvelService: APIEndpoint {
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
        case let .getCharactersListMarvel(page):
            let timestamp = Int(Date().timeIntervalSince1970)
            let publicKey = EnvironmentService.getValue(for: .URL(.publicKeyMarvel))
            let privateKey = EnvironmentService.getValue(for: .URL(.privateKeyMarvel))
            let hash = "\(timestamp)\(privateKey)\(publicKey)"
            let limit = 20
            let offset = limit * page
            return "/v1/public/characters" + "?\(APIParameterKey.timestamp.rawValue)=\(timestamp)"
              + "&\(APIParameterKey.hash.rawValue)=\(hash.md5())"
              + "&\(APIParameterKey.apiKey.rawValue)=\(publicKey)"
              + "&\(APIParameterKey.limit.rawValue)=\(limit)"
              + "&\(APIParameterKey.offset.rawValue)=\(offset)"
        }
    }

    var contentType: ContentType {
        .formUrlEncoded
    }

    var mockName: String {
        R.file.characterListMarvelJson()!.path
    }
}
