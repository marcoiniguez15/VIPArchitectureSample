//
//  APIClient.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//
import Foundation
import Alamofire

typealias NetworkError = AFError

protocol APIClientProtocol {
  func getCharactersListLastFM(limit: Int, page: Int, completion:@escaping (Result<ArtistsLastFM, NetworkError>, Int?) -> Void)
  func getAlbumsListLastFM(characterId: Int, limit: Int, page: Int, completion:@escaping (Result<AlbumsLastFM, NetworkError>, Int?) -> Void)
  func getAllCharactersRickAndMorty(page: Int, completion:@escaping (Result<CharactersRickAndMorty, NetworkError>, Int?) -> Void)
}
final class APIClient {
  private static var instance: APIClient?
  static var shared: APIClient {
    if let instance = self.instance {
      return instance
    } else {
      let configuration = URLSessionConfiguration.default
      configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
      configuration.timeoutIntervalForRequest = 30
      let manager = Session(configuration: configuration)
      instance = APIClient(manager: manager)
      return instance!
    }
  }
  let manager: Session
  private init(manager: Session) {
    self.manager = manager
  }
}

// MARK: - Public
extension APIClient: APIClientProtocol {
  func getAllCharactersRickAndMorty(page: Int, completion: @escaping (Result<CharactersRickAndMorty, NetworkError>, Int?) -> Void) {
    performRequest(route: .getAllCharactersRickAndMorty(page: page), completion: completion)
  }
  
  func getCharactersListLastFM(limit: Int, page: Int, completion:@escaping (Result<ArtistsLastFM, NetworkError>, Int?) -> Void) {
    performRequest(route: .getCharactersListLastFM(limit: limit, page: page), completion: completion)
  }
  func getAlbumsListLastFM(characterId: Int, limit: Int, page: Int, completion:@escaping (Result<AlbumsLastFM, NetworkError>, Int?) -> Void) {
    performRequest(route: .getAlbumsListLastFM(characterId: characterId, limit: limit, page: page), completion: completion)
  }
  
}

// MARK: - Private
private extension APIClient {
  @discardableResult
  func performRequest<T: Decodable>(route: APIRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>, Int?) -> Void) -> DataRequest {
    return APIClient.shared.manager.request(route)
      .validate(statusCode: 200..<300)
      .responseDecodable(decoder: decoder) { (response: DataResponse<T, AFError>) in
        completion(response.result, response.response?.statusCode)
      }
  }
  @discardableResult
  func performRequestData(route: APIRouter, completion:@escaping (Result<Data?, AFError>, Int?) -> Void) -> DataRequest {
    return APIClient.shared.manager.request(route)
      .validate(statusCode: 200..<300)
      .response { response in
        completion(response.result, response.response?.statusCode)
      }
  }
  @discardableResult
  func performMultiPartRequest(route: APIRouter, payload: [String: Any], urlFile: String, completion:@escaping (Result<Data?, AFError>, Int?) -> Void) -> DataRequest {
    return APIClient.shared.manager.upload(multipartFormData: { (multiPart) in
      let dataPayload = try? JSONSerialization.data(withJSONObject: payload)
      multiPart.append(dataPayload!, withName: "payload")
      multiPart.append(URL(fileURLWithPath: urlFile), withName: "file")
    }, with: route)
    .validate(statusCode: 200..<300)
    .response { response in
      completion(response.result, response.response?.statusCode)
    }
  }
}
