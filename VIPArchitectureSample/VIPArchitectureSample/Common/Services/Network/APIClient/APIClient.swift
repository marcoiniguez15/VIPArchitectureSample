//

import Foundation
import Alamofire

protocol APIClientProtocol {
    func performRequest<T: Decodable>(endpoint: APIEndpoint, responseModel: T.Type) async throws -> T
}

final class APIClient: APIClientProtocol {
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

    func performRequest<T: Decodable>(endpoint: APIEndpoint, responseModel: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            var header:[HTTPHeader] = []
            if let endPointHeader = endpoint.header {
                header =  endPointHeader.compactMap { item -> HTTPHeader in
                    return HTTPHeader(name: item.key, value: item.value)
                }
            }
            APIClient.shared.manager.request(
                endpoint.scheme + endpoint.basePath + endpoint.path,
                method: HTTPMethod(rawValue: endpoint.method.rawValue),
                parameters: endpoint.body,
                headers: HTTPHeaders(header),
                requestModifier: { $0.timeoutInterval = 30 }
            )
            .validate(statusCode: 200..<300)
            .responseDecodable(of: responseModel.self) { response in
                switch(response.result) {
                case let .success(data):
                    guard let json = response.data,  let output = String(data: json, encoding: .utf8)
                        else { fatalError( "Error converting \(data) to JSON string") }
                    print("🛜🛜🛜" + "JSON string = \(output)")
                    continuation.resume(returning: data)
                case let .failure(error):
                    print("🔵🔵🔵")
                    debugPrint(error)
                    print("🔵🔵🔵")
                    if response.response?.statusCode == 401 {
                        continuation.resume(throwing: CustomNetworkError.unauthorized)
                    } else {
                        continuation.resume(throwing: CustomNetworkError.serverError)
                    }
                }

            }
        }

    }
}

private extension APIClient {
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

