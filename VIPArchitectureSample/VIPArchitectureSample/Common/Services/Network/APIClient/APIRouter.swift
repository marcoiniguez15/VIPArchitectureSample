//
//  APIRouter.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.

import Foundation
import Alamofire

enum APIRouter {
  case getCharactersListRickMortyRickMortyLastFM(limit: Int, page: Int)
  case getAlbumsListLastFM(characterId: String, limit: Int)
  case getAllCharactersRickAndMorty(page: Int, nameFilter: String?)
  case getCharactersListMarvel(page: Int)
  case getCharacterDetailMarvel(id: Int)
}


private extension APIRouter {
  var baseURLKey: EnvironmentService.Keys {
    switch self {
    case .getCharactersListRickMortyRickMortyLastFM, .getAlbumsListLastFM:
        return .URL(.baseURLLastFM)
      
    case .getAllCharactersRickAndMorty:
      return .URL(.baseURLRickMorty)
      
    case .getCharacterDetailMarvel, .getCharactersListMarvel:
      return .URL(.baseURLMarvel)
    }
  }
  
  // MARK: - HTTPMethod
  var method: HTTPMethod {
    switch self {
    case .getCharactersListRickMortyRickMortyLastFM,
        .getAlbumsListLastFM, .getAllCharactersRickAndMorty, .getCharacterDetailMarvel, .getCharactersListMarvel:
      return .get
    
    }
  }
  
  // MARK: - Path
  var path: String {
    switch self {
    case let .getCharactersListRickMortyRickMortyLastFM(limit, page):
      let apiKey = EnvironmentService.getValue(for: .URL(.apiKeyLASTFM))
      let method = "chart.gettopartists"
      
      return "/?method=\(method)&api_key=\(apiKey)&format=json"
      + "&\(APIParameterKey.limit.rawValue)=\(limit)"
      + "&\(APIParameterKey.page.rawValue)=\(page)"
      
    case let .getAlbumsListLastFM(id, limit):
      let apiKey = EnvironmentService.getValue(for: .URL(.apiKeyLASTFM))
      let method = "artist.gettopalbums"
      
      return "/?method=\(method)&api_key=\(apiKey)&mbid=\(id)&format=json"
      + "&\(APIParameterKey.limit.rawValue)=\(limit)"
      
    case let .getAllCharactersRickAndMorty(page, nameFilter):
      var pathUrl = "/character/?page=\(page)"
      if let name = nameFilter {
        pathUrl += "&name=\(name)"
      }
      return pathUrl
      
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
  
  // MARK: - Parameters
  var parameters: Parameters? {
    switch self {
    case .getCharactersListRickMortyRickMortyLastFM,
         .getAlbumsListLastFM,
         .getAllCharactersRickAndMorty, .getCharacterDetailMarvel, .getCharactersListMarvel:
      return nil
    }
  }
  
  // MARK: - ContentType
  var contentType: ContentType {
    switch self {
    case .getCharactersListRickMortyRickMortyLastFM,
         .getAlbumsListLastFM,
         .getAllCharactersRickAndMorty,
         .getCharacterDetailMarvel,
         .getCharactersListMarvel:
      return .formUrlEncoded
    }
  }
}

// MARK: - URLRequestConvertible
extension APIRouter: URLRequestConvertible {
  func asURLRequest() throws -> URLRequest {
   
    let url = try generateURL(for: baseURLKey, path: path)
    var urlRequest = URLRequest(url: url)
    // HTTP Method
    urlRequest.httpMethod = method.rawValue
    // Common Headers
    urlRequest.setValue(HeadersParams.defaultAccept.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
    urlRequest.setValue(HeadersParams.keepAlive.rawValue, forHTTPHeaderField: HTTPHeaderField.connection.rawValue)
    urlRequest.setValue(HeadersParams.gzipDeflateBr.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptEncoding.rawValue)
    urlRequest.setValue(contentType.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    if let parameters = parameters {
      switch self.contentType {
      case .json:
        // Parameters
        urlRequest.httpBody = try getBodyJSONParams(parameters: parameters)
        
      case .formUrlEncoded:
        // Parameters
        urlRequest.httpBody = getBodyFormUrlEncodedParams(parameters: parameters)
        
      case .multipart:
        // Parameters
        break
      }
    }
  
    return urlRequest
  }
}
// MARK: - Private
private extension APIRouter {
  
  func getBaseURL(for key: EnvironmentService.Keys) -> String {
    let urlString = EnvironmentService.getValue(for: key)
    return urlString
  }
  func generateURL(for baseKey:EnvironmentService.Keys, path: String) throws -> URL {
    let baseURL = getBaseURL(for: baseKey)
    let urlString = baseURL + path
    guard let url = URL(string: urlString) else {
      throw CustomNetworkError.unsuppotedURL
    }
    return url
  }
  
  func getBodyJSONParams(parameters: Parameters) throws -> Data? {
    do {
      return try JSONSerialization.data(withJSONObject: parameters, options: [])
    } catch {
      throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
    }
  }
  
  func getBodyFormUrlEncodedParams(parameters: Parameters) -> Data? {
    guard let postData = parameters.queryString.data(using: .utf8)
    else { return nil }
    return postData
  }
}
